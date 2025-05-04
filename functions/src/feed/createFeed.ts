// functions/src/feed/createFeed.ts
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const createFeed = functions.https.onRequest(async (req, res:any) => {
    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const { contentBlocks, quizzes } = req.body;

        if (!Array.isArray(contentBlocks)) {
            return res.status(400).json({ success: false, message: "contentBlocks는 배열이어야 합니다." });
        }

        const db = admin.firestore();
        const now = admin.firestore.Timestamp.now();

        const userDoc = await db.collection("users").doc(uid).get();
        const user = userDoc.exists ? userDoc.data() : {};

        const feedRef = db.collection("feeds").doc();
        const feedData = {
            uid,
            nickname: user!.nickname ?? '',
            title: user!.title ?? '',
            level: user!.level ?? 1,
            avatarUrl: user!.avatarUrl ?? '',
            contentBlocks,
            quizzes: quizzes ?? [],
            likeCount: 0,
            commentCount: 0,
            createdAt: now,
            updatedAt: now,
        };

        await feedRef.set(feedData);

        return res.status(200).json({
            success: true,
            message: "피드가 성공적으로 생성되었습니다.",
            data: { feedId: feedRef.id },
        });
    } catch (error) {
        console.error("createFeed error:", error);
        return res.status(500).json({ success: false, message: "서버 오류 발생" });
    }
});
