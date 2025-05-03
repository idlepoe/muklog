import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const isFollowing = onRequest({cors: true}, async (req, res: any) => {
    const decoded = await verifyAuth(req);
    const uid = decoded.uid;
    const {targetUid} = req.query;

    if (!targetUid) {
        return res.status(400).json({success: false, message: 'targetUid is required'});
    }

    const snap = await admin.firestore()
        .collection('users')
        .doc(uid)
        .collection('following')
        .doc(String(targetUid))
        .get();

    return res.status(200).json({
        success: true,
        data: {isFollowing: snap.exists},
    });
});
