import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";
import * as admin from "firebase-admin";

export const checkAlreadySolved = onRequest({ cors: true }, async (req, res:any) => {
  const uid = (await verifyAuth(req)).uid;
  const questionId = req.query.questionId;
  const db = admin.firestore();

  const snapshot = await db.collection('plays')
    .where('uid', '==', uid)
    .where('questionId', '==', questionId)
    .limit(1)
    .get();

  return res.status(200).json({
    success: true,
    data: { alreadySolved: !snapshot.empty }
  });
});
