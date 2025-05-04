import * as admin from "firebase-admin";
import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";

export const sendFeedReaction = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== 'POST') return res.status(405).send('Method Not Allowed');
    try {
        const db = admin.firestore();
        const {feedId, reaction} = req.body;
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const validReactions = [
            'like',
            'funny',
            'bad',
            'expensive',
            'interesting',
        ];
        if (!validReactions.includes(reaction)) {
            return res.status(400).json({success: false, message: '유효하지 않은 리액션'});
        }

        // 리액션 중복 방지
        const reactionDoc = db
            .collection('feeds')
            .doc(feedId)
            .collection('reactions')
            .doc(uid);

        const exists = (await reactionDoc.get()).exists;
        if (exists) {
            return res.status(200).json({success: false, message: '이미 반응함'});
        }

        await db.runTransaction(async (tx) => {
            const feedRef = db.collection('feeds').doc(feedId);
            tx.update(feedRef, {
                [`count${capitalize(reaction)}`]: admin.firestore.FieldValue.increment(1),
            });
            tx.set(reactionDoc, {type: reaction, createdAt: admin.firestore.FieldValue.serverTimestamp()});
        });

        return res.status(200).json({success: true, message: '반응 등록 완료'});
    } catch (e) {
        console.error('sendFeedReaction error', e);
        return res.status(500).json({success: false, message: '서버 오류'});
    }
});

function capitalize(text: string) {
    return text.charAt(0).toUpperCase() + text.slice(1);
}
