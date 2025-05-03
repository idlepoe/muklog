import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {getUserSummary, verifyAuth} from "../utils/auth";

export const getFollowers = onRequest({cors: true}, async (req, res: any) => {
    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const followerSnap = await admin.firestore()
            .collection('users')
            .doc(uid)
            .collection('followers')
            .get();

        const uids = followerSnap.docs.map(doc => doc.id);

        const followers = await Promise.all(
            uids.map(uid => getUserSummary(uid))
        );

        return res.status(200).json({
            success: true,
            data: followers.filter(Boolean), // null 제거
        });
    } catch (e) {
        console.error("getFollowers error:", e);
        return res.status(500).json({success: false, message: "서버 오류"});
    }
});
