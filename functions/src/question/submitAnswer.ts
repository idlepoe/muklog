import {onRequest} from "firebase-functions/v2/https";
import {verifyAuth} from "../utils/auth";
import * as admin from "firebase-admin";
import {getLevelFromPoint, getTitleFromLevel} from "../utils/getLevelFromPoint";

export const submitAnswer = onRequest({cors: true}, async (req, res: any) => {
    const {questionId, selected} = req.body;
    const decoded = await verifyAuth(req);
    const uid = decoded.uid;

    const db = admin.firestore();

    // playCount 증가
    await db.collection('questions').doc(questionId).update({
        playCount: admin.firestore.FieldValue.increment(1)
    });

    // 중복 풀이 체크
    const playsRef = db.collection('plays');
    const existingPlaySnap = await playsRef
        .where('uid', '==', uid)
        .where('questionId', '==', questionId)
        .limit(1)
        .get();

    if (!existingPlaySnap.empty) {
        return res.status(400).json({
            success: false,
            message: '이미 푼 문제입니다.',
        });
    }

    // 문제 정보 가져오기
    const questionDoc = await db.collection('questions').doc(questionId).get();
    const data = questionDoc.data();
    if (!data || typeof data.answer !== 'string') {
        return res.status(500).json({success: false, message: '문제 데이터 오류'});
    }

    // 정답 여부 판단
    const isCorrect = selected === data.answer;
    const point = isCorrect ? 10 : 0;
    const now = admin.firestore.Timestamp.now();

    // 풀이 기록 저장
    await db.collection('plays').add({
        uid,
        questionId,
        selected,
        isCorrect,
        createdAt: now,
    });

    // 사용자 정보 가져오기
    const userRef = db.collection('users').doc(uid);
    const userSnap = await userRef.get();
    const user = userSnap.data();
    const currentPoint = user?.point ?? 0;
    const currentLevel = user?.level ?? 1;
    const newPoint = currentPoint + point;
    const newLevel = getLevelFromPoint(newPoint);
    const newTitle = getTitleFromLevel(newLevel);

    // 플레이 저장 후 통계 계산
    const playsSnap = await db.collection('plays')
        .where('uid', '==', uid)
        .get();

    const total = playsSnap.size;
    const correct = playsSnap.docs.filter(doc => doc.data().isCorrect).length;
    const correctRate = total > 0 ? Math.round((correct / total) * 100) : 0;

    const updateData: any = {
        point: admin.firestore.FieldValue.increment(point),
        level: newLevel,
        title: newTitle,
        correctRate,
        updatedAt: now,
        playCount: admin.firestore.FieldValue.increment(1),
    };

    if (newLevel > currentLevel) {
        updateData.levelUpAt = now;
    }

    // 포인트, 레벨 업데이트
    await userRef.update(updateData);

    // 2. 출제자 uid
    const authorUid = data.uid; // ← 문제 작성자 UID

    // 3. 출제자 정보 가져오기
    const authorDoc = await db.collection('users').doc(authorUid).get();
    const authorData = authorDoc.data();
    const authorInfo = authorData ? {
        uid: authorUid,
        nickname: authorData.nickname ?? '알 수 없음',
        avatarUrl: authorData.avatarUrl ?? '',
    } : null;

    // 팔로우 상태 확인 (내 uid → 출제자 uid)
    const followSnap = await db.collection('users')
        .doc(uid)
        .collection('following')
        .doc(authorUid)
        .get();

    const isFollowing = followSnap.exists;

    return res.status(200).json({
        success: true,
        data: {
            isCorrect,
            pointGained: point,
            newLevel,
            levelUp: newLevel > currentLevel,
            author: {
                ...authorInfo,
                isFollowing,
            },
        },
    });
});
