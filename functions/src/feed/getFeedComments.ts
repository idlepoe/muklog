// functions/src/feed/getFeeds.ts
import * as admin from "firebase-admin";
import {onRequest} from "firebase-functions/https";

export const getFeedComments = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== 'GET') return res.status(405).send('Method Not Allowed');
    try {
        const feedId = req.query.feedId as string;
        if (!feedId) return res.status(400).json({success: false, message: 'feedId가 필요합니다.'});

        const snapshot = await admin.firestore()
            .collection('feeds')
            .doc(feedId)
            .collection('comments')
            .orderBy('createdAt', 'asc')
            .get();

        const comments = snapshot.docs.map(doc => ({
            commentId: doc.id,
            ...doc.data(),
        }));

        return res.status(200).json({
            success: true,
            message: '댓글 불러오기 성공',
            data: comments,
        });
    } catch (e) {
        console.error('getFeedComments error', e);
        return res.status(500).json({success: false, message: '서버 오류'});
    }
});
