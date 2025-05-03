import {onRequest} from "firebase-functions/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const getRankingList = onRequest({cors: true}, async (req, res: any) => {
    try {
        const uid = (await verifyAuth(req)).uid;

        const db = admin.firestore();
        const usersSnap = await db.collection('users').get();

        const allUsers = usersSnap.docs.map(doc => ({
            uid: doc.id,
            nickname: doc.data().nickname,
            avatarUrl: doc.data().avatarUrl ?? '',
            point: doc.data().point ?? 0,
            level: doc.data().level ?? 1,
            title: doc.data().title ?? '',
            questionCount: doc.data().questionCount ?? 0,
            correctRate: doc.data().correctRate ?? 0,
            playCount: doc.data().playCount ?? 0,
            levelUpAt: doc.data().levelUpAt?.toDate() ?? null,
        }));

        const pointRanking = [...allUsers].filter(u => u.point > 0).sort((a, b) => b.point - a.point).slice(0, 50);
        const levelUpRanking = allUsers.filter(u => u.levelUpAt).sort((a, b) => b.levelUpAt - a.levelUpAt).slice(0, 20);
        const questionRanking = [...allUsers].filter(u => u.point > 0).sort((a, b) => b.questionCount - a.questionCount).slice(0, 20);
        const accuracyRanking = [...allUsers]
            .filter(u => u.playCount > 0)
            .sort((a, b) => {
                if (b.correctRate !== a.correctRate) return b.correctRate - a.correctRate;
                return b.playCount - a.playCount;
            })
            .slice(0, 20);

        const sorted = allUsers.sort((a, b) => b.point - a.point);
        const myRankIndex = sorted.findIndex(u => u.uid === uid);

        const myPointRank = myRankIndex >= 0
            ? {
                rank: myRankIndex + 1,
                point: sorted[myRankIndex].point,
            }
            : null;

        return res.status(200).json({
            success: true,
            data: {
                pointRanking,
                levelUpRanking,
                questionRanking,
                accuracyRanking,
                myPointRank,
            },
        });
    } catch (e) {
        console.error("getRankingList error:", e);
        return res.status(500).json({success: false, message: "랭킹 조회 실패"});
    }
});
