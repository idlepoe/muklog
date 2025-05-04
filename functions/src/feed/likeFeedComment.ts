import * as admin from "firebase-admin";
import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";

export const likeFeedComment = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== 'POST') return res.status(405).send('Method Not Allowed');
    try {
        const {feedId, commentId} = req.body;
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const db = admin.firestore();
        const likeRef = db.collection('feeds').doc(feedId)
            .collection('comments').doc(commentId)
            .collection('likes').doc(uid);

        const alreadyLiked = await likeRef.get();
        if (alreadyLiked.exists) {
            return res.status(200).json({success: false, message: '이미 좋아요를 눌렀습니다.'});
        }

        // 좋아요 등록
        await likeRef.set({likedAt: admin.firestore.Timestamp.now()});

        // 댓글 likeCount 증가
        await db.collection('feeds').doc(feedId)
            .collection('comments').doc(commentId)
            .update({
                likeCount: admin.firestore.FieldValue.increment(1),
            });

        return res.status(200).json({success: true, message: '댓글 좋아요 완료'});
    } catch (e) {
        console.error('likeFeedComment error', e);
        return res.status(500).json({success: false, message: '서버 오류'});
    }
});
