import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";
import {getLevelFromPoint, getTitleFromLevel} from "../utils/getLevelFromPoint"; // 토큰 인증 유틸

export const createQuestion = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== "POST") {
        return res.status(405).json({success: false, message: "Method Not Allowed"});
    }

    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;
        const {
            question,
            choices,
            answer,
            explanation,
            imageUrl,
            userPrice,
            type,
            foodName,
        } = req.body;

        if (!question || !choices || !answer || !explanation || !imageUrl) {
            return res.status(400).json({success: false, message: "필수 정보 누락"});
        }

        const now = admin.firestore.Timestamp.now();

        const data = {
            uid,
            question,
            choices,
            answer,
            explanation,
            imageUrl,
            userPrice,
            type,
            foodName: foodName ?? "",
            createdAt: now,
            updatedAt: now,
            likeCount: 0,
            playCount: 0,
        };

        const docRef = await admin.firestore().collection("questions").add(data);

        // 문제 등록 후 아래 추가
        const userRef = admin.firestore().collection('users').doc(uid);
        const pointToAdd = 50; // 출제 포인트

        const userSnap = await userRef.get();
        const user = userSnap.data();
        const currentPoint = user?.point ?? 0;
        const newPoint = currentPoint + pointToAdd;
        const newLevel = getLevelFromPoint(newPoint);
        const currentLevel = user?.level ?? 1;
        const newTitle = getTitleFromLevel(newLevel);

        const updateData: any = {
            point: admin.firestore.FieldValue.increment(pointToAdd),
            level: newLevel,
            title: newTitle,
            questionCount: admin.firestore.FieldValue.increment(1),
            updatedAt: now,
        };

        if (newLevel > currentLevel) {
            updateData.levelUpAt = now;
        }

        await userRef.update(updateData);

        return res.status(200).json({
            success: true,
            message: "문제 출제 완료",
            data: {
                questionId: docRef.id,
                pointGained: pointToAdd,
                levelUp: newLevel > currentLevel,
            },
        });
    } catch (e) {
        console.error("createQuestion error:", e);
        return res.status(500).json({
            success: false,
            message: "서버 오류 발생",
        });
    }
});
