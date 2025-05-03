import {onRequest} from "firebase-functions/https";
import * as admin from "firebase-admin";

export const getRecentLevelUps = onRequest({cors: true}, async (req, res: any) => {
    try {
        const snapshot = await admin.firestore()
            .collection('users')
            .orderBy('updatedAt', 'desc')
            .limit(20)
            .get();

        const recent = snapshot.docs
            .map(doc => ({
                uid: doc.id,
                nickname: doc.data().nickname,
                avatarUrl: doc.data().avatarUrl ?? '',
                level: doc.data().level,
                updatedAt: doc.data().updatedAt.toDate(),
            }))
            .filter(user => user.level > 1); // 최소 레벨업한 사람만

        return res.status(200).json({
            success: true,
            data: recent,
        });
    } catch (e) {
        console.error("getRecentLevelUps error:", e);
        return res.status(500).json({success: false, message: "서버 오류"});
    }
});