import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const getDailyQuestions = onRequest({ cors: true }, async (req, res: any) => {
    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const db = admin.firestore();
        const usersRef = db.collection("users");
        const questionsRef = db.collection("questions");

        // 사용자가 이미 푼 문제 목록
        const playsSnap = await db.collection("plays").where("uid", "==", uid).get();
        const solvedIds = new Set(playsSnap.docs.map(doc => doc.data().questionId));

        // 사용자가 작성한 문제 제외 + 이미 푼 문제 제외
        const allSnap = await questionsRef.limit(100).get();
        const filteredDocs = allSnap.docs.filter(doc => {
            const q = doc.data();
            return q.uid !== uid && !solvedIds.has(doc.id);
        });

        // 랜덤 질문 1개
        let randomQuestion = null;
        if (filteredDocs.length > 0) {
            const doc = filteredDocs[Math.floor(Math.random() * filteredDocs.length)];
            randomQuestion = { questionId: doc.id, ...doc.data() };
        }

        // 친구 문제 1개
        const userDoc = await usersRef.doc(uid).get();
        const followings = userDoc.data()?.following ?? [];
        let friendQuestion = null;
        if (followings.length > 0) {
            const friendSnap = await questionsRef
                .where("uid", "in", followings.slice(0, 10))
                .limit(10)
                .get();
            const friendFiltered = friendSnap.docs.filter(doc => !solvedIds.has(doc.id));
            if (friendFiltered.length > 0) {
                const doc = friendFiltered[Math.floor(Math.random() * friendFiltered.length)];
                friendQuestion = { questionId: doc.id, ...doc.data() };
            }
        }

        // 인기 문제 1개 (좋아요 순)
        let popularQuestion = null;
        const popularSnap = await questionsRef.orderBy("likeCount", "desc").limit(20).get();
        const popularFiltered = popularSnap.docs.filter(doc => {
            const q = doc.data();
            return q.uid !== uid && !solvedIds.has(doc.id);
        });
        if (popularFiltered.length > 0) {
            const doc = popularFiltered[0];
            popularQuestion = { questionId: doc.id, ...doc.data() };
        }

        return res.status(200).json({
            success: true,
            message: "오늘의 문제 불러오기 성공",
            data: {
                random: randomQuestion,
                friend: friendQuestion,
                popular: popularQuestion,
            },
        });
    } catch (e) {
        console.error("getDailyQuestions error", e);
        return res.status(500).json({ success: false, message: "서버 오류 발생" });
    }
});
