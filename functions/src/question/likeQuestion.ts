import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const likeQuestion = onRequest({cors: true}, async (req, res: any) => {
    const {questionId} = req.body;
    await verifyAuth(req);
    await admin.firestore().collection('questions').doc(questionId).update({
        likeCount: admin.firestore.FieldValue.increment(1)
    });

    return res.status(200).json({success: true});
});
