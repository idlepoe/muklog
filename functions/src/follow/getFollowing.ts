import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {getUserSummary, verifyAuth} from "../utils/auth";

export const getFollowing = onRequest({cors: true}, async (req, res: any) => {
    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const followingSnap = await admin.firestore()
            .collection('users')
            .doc(uid)
            .collection('following')
            .get();

        const uids = followingSnap.docs.map(doc => doc.id);

        const following = await Promise.all(
            uids.map(uid => getUserSummary(uid))
        );

        return res.status(200).json({
            success: true,
            data: following.filter(Boolean),
        });
    } catch (e) {
        console.error("getFollowing error:", e);
        return res.status(500).json({success: false, message: "서버 오류"});
    }
});
