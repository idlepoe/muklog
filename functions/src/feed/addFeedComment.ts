import * as admin from "firebase-admin";
import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";

export const addFeedComment = onRequest({ cors: true }, async (req, res: any) => {
    if (req.method !== 'POST') return res.status(405).send('Method Not Allowed');
    try {
        const db = admin.firestore();
        const { feedId, text } = req.body;
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const userSnap = await db.collection('users').doc(uid).get();
        const user = userSnap.data() || {};
        const nickname = user.nickname ?? '알 수 없음';
        const avatarUrl = user.avatarUrl ?? '';

        const createdAt = admin.firestore.Timestamp.now();

        const commentRef = await db
            .collection('feeds')
            .doc(feedId)
            .collection('comments')
            .add({
                uid,
                text,
                nickname,
                avatarUrl,
                createdAt,
            });

        await db.collection('feeds').doc(feedId).update({
            commentCount: admin.firestore.FieldValue.increment(1),
        });

        // 응답으로 새 댓글 정보 제공
        return res.status(200).json({
            success: true,
            message: '댓글 등록 완료',
            data: {
                commentId: commentRef.id,
                uid,
                text,
                nickname,
                avatarUrl,
                createdAt,
            },
        });
    } catch (e) {
        console.error('addFeedComment error', e);
        return res.status(500).json({ success: false, message: '서버 오류' });
    }
});
