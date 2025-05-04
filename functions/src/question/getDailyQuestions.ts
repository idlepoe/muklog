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

        const playsSnap = await db.collection("plays").where("uid", "==", uid).get();
        const solvedIds = new Set(playsSnap.docs.map(doc => doc.data().questionId));

        const allSnap = await questionsRef.limit(100).get();
        const filteredDocs = allSnap.docs.filter(doc => {
            const q = doc.data();
            return q.uid !== uid && !solvedIds.has(doc.id);
        });

        let randomQuestion = null;
        if (filteredDocs.length > 0) {
            const doc = filteredDocs[Math.floor(Math.random() * filteredDocs.length)];
            const q = doc.data();
            const user = await usersRef.doc(q.uid).get();
            randomQuestion = {
                questionId: doc.id,
                ...q,
                creatorNickname: user.exists ? user.data()?.nickname ?? '알 수 없음' : '알 수 없음',
                creatorAvatarUrl: user.exists ? user.data()?.avatarUrl ?? '' : '',
            };
        }

        const followingSnap = await usersRef.doc(uid).collection('following').get();
        const followings = followingSnap.docs.map(doc => doc.id); // UID 리스트

        let friendQuestion = null;
        if (followings.length > 0) {
            const friendSnap = await questionsRef
                .where("uid", "in", followings.slice(0, 10))
                .limit(10)
                .get();

            const friendFiltered = friendSnap.docs.filter(doc => !solvedIds.has(doc.id));
            if (friendFiltered.length > 0) {
                const doc = friendFiltered[Math.floor(Math.random() * friendFiltered.length)];
                const q = doc.data();
                const user = await usersRef.doc(q.uid).get();
                friendQuestion = {
                    questionId: doc.id,
                    ...q,
                    creatorNickname: user.exists ? user.data()?.nickname ?? '알 수 없음' : '알 수 없음',
                    creatorAvatarUrl: user.exists ? user.data()?.avatarUrl ?? '' : '',
                };
            }
        }

        let popularQuestion = null;
        const popularSnap = await questionsRef.orderBy("likeCount", "desc").limit(20).get();
        const popularFiltered = popularSnap.docs.filter(doc => {
            const q = doc.data();
            return q.uid !== uid && !solvedIds.has(doc.id);
        });
        if (popularFiltered.length > 0) {
            const doc = popularFiltered[0];
            const q = doc.data();
            const user = await usersRef.doc(q.uid).get();
            popularQuestion = {
                questionId: doc.id,
                ...q,
                creatorNickname: user.exists ? user.data()?.nickname ?? '알 수 없음' : '알 수 없음',
                creatorAvatarUrl: user.exists ? user.data()?.avatarUrl ?? '' : '',
            };
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

