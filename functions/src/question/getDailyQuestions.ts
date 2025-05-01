import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const getDailyQuestions = onRequest({cors: true}, async (req, res: any) => {
    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const db = admin.firestore();
        const usersRef = db.collection("users");
        const questionsRef = db.collection("questions");

        // 랜덤 질문 1개
        const randomSnap = await questionsRef.limit(10).get();
        const randomList = randomSnap.docs;
        let randomQuestion = null;

        if (!randomSnap.empty) {
            const doc = randomList[Math.floor(Math.random() * randomList.length)];
            randomQuestion = {questionId: doc.id, ...doc.data()};
        }

        // 친구 문제 1개
        const userDoc = await usersRef.doc(uid).get();
        const followings = userDoc.data()?.following ?? [];
        let friendQuestion = null;
        if (followings.length > 0) {
            const friendSnap = await questionsRef
                .where("uid", "in", followings.slice(0, 10))
                .limit(1)
                .get();
            if (!friendSnap.empty) {
                const doc = friendSnap.docs[0];
                friendQuestion = {questionId: doc.id, ...doc.data()};
            }
        }

        let popularQuestion = null;

        // 인기 문제 1개
        const popularSnap = await questionsRef
            .orderBy("likeCount", "desc")
            .limit(1)
            .get();
        if (!popularSnap.empty) {
            const doc = popularSnap.docs[0];
            popularQuestion = {questionId: doc.id, ...doc.data()};
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
        return res.status(500).json({success: false, message: "서버 오류 발생"});
    }
});
