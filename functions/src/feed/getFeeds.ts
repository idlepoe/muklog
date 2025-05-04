// functions/src/feed/getFeeds.ts
import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

export const getFeeds = functions.https.onRequest(async (req, res: any) => {
    try {
        const db = admin.firestore();
        const {startAfterId} = req.body;

        let query = db
            .collection("feeds")
            .orderBy("createdAt", "desc")
            .limit(20);

        // 페이징 처리를 위한 시작 포인트 지정
        if (startAfterId) {
            const startAfterDoc = await db.collection("feeds").doc(startAfterId).get();
            if (startAfterDoc.exists) {
                query = query.startAfter(startAfterDoc);
            }
        }

        const snapshot = await query.get();
        const feeds = snapshot.docs.map(doc => ({
            feedId: doc.id,
            ...doc.data()
        }));

        return res.status(200).json({
            success: true,
            message: "피드 목록을 불러왔습니다.",
            data: feeds
        });
    } catch (error) {
        console.error("getFeeds error:", error);
        return res.status(500).json({success: false, message: "서버 오류 발생"});
    }
});
