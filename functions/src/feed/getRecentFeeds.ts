import * as admin from "firebase-admin";
import {onRequest} from "firebase-functions/https";

export const getRecentFeeds = onRequest({cors: true}, async (req, res: any) => {
    try {
        const limit = parseInt(req.query.limit as string || '3');
        const snapshot = await admin
            .firestore()
            .collection('feeds')
            .orderBy('createdAt', 'desc')
            .limit(limit)
            .get();

        const data = await Promise.all(
            snapshot.docs.map(async (doc) => {
                const feed = doc.data();
                const userSnap = await admin.firestore().collection('users').doc(feed.uid).get();
                const user = userSnap.data() ?? {};
                return {
                    feedId: doc.id,
                    ...feed,
                    nickname: user.nickname ?? '알 수 없음',
                    avatarUrl: user.avatarUrl ?? '',
                    title: user.title ?? '',
                    level: user.level ?? 1,
                };
            })
        );

        return res.status(200).json({
            success: true,
            message: '최근 피드 불러오기 성공',
            data,
        });
    } catch (e) {
        console.error('getRecentFeeds error', e);
        return res.status(500).json({success: false, message: '서버 오류'});
    }
});
