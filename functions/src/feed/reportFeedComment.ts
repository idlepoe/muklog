import * as admin from "firebase-admin";
import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";

export const reportFeedComment = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== 'POST') return res.status(405).send('Method Not Allowed');
    try {
        const {feedId, commentId} = req.body;
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const db = admin.firestore();
        const reportRef = db.collection('feeds').doc(feedId)
            .collection('comments').doc(commentId)
            .collection('reports').doc(uid);

        const alreadyReported = await reportRef.get();
        if (alreadyReported.exists) {
            return res.status(200).json({success: false, message: '이미 신고한 댓글입니다.'});
        }

        await reportRef.set({reportedAt: admin.firestore.Timestamp.now()});

        await db.collection('feeds').doc(feedId)
            .collection('comments').doc(commentId)
            .update({
                reportCount: admin.firestore.FieldValue.increment(1),
            });

        return res.status(200).json({success: true, message: '댓글 신고 완료'});
    } catch (e) {
        console.error('reportFeedComment error', e);
        return res.status(500).json({success: false, message: '서버 오류'});
    }
});
