import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";
import * as admin from "firebase-admin";

export const submitAnswer = onRequest({ cors: true }, async (req, res:any) => {
  const { questionId, selected } = req.body;
  const decoded = await verifyAuth(req);
  const uid = decoded.uid;

    const db = admin.firestore();

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

    const questionDoc = await db.collection('questions').doc(questionId).get();

    const data = questionDoc.data();
    if (!data || typeof data.answer !== 'string') {
        return res.status(500).json({ success: false, message: '문제 데이터 오류' });
    }
    const isCorrect = selected === data.answer;
    const point = isCorrect ? 10 : 0;

    await db.collection('users').doc(uid).update({
    point: admin.firestore.FieldValue.increment(point),
    updatedAt: admin.firestore.Timestamp.now(),
  });

  // 플레이 기록 저장
  await db.collection('plays').add({
    uid,
    questionId,
    selected,
    isCorrect,
    createdAt: admin.firestore.Timestamp.now(),
  });

  return res.status(200).json({
    success: true,
    data: { isCorrect, point },
  });
});
