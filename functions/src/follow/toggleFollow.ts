import {onRequest} from "firebase-functions/v2/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

export const toggleFollow = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== "POST") {
        return res.status(405).json({success: false, message: "Method Not Allowed"});
    }

    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;
        const {targetUid} = req.body;

        if (!targetUid) {
            return res.status(400).json({success: false, message: "targetUid is required"});
        }

        if (uid === targetUid) {
            return res.status(400).json({success: false, message: "자기 자신은 팔로우할 수 없습니다."});
        }

        const db = admin.firestore();

        const followingRef = db.collection('users').doc(uid).collection('following').doc(targetUid);
        const followerRef = db.collection('users').doc(targetUid).collection('followers').doc(uid);

        const userRef = db.collection('users').doc(uid);
        const targetRef = db.collection('users').doc(targetUid);

        const now = admin.firestore.Timestamp.now();

        const isFollowing = (await followingRef.get()).exists;

        if (isFollowing) {
            // 언팔로우 처리
            await Promise.all([
                followingRef.delete(),
                followerRef.delete(),
                userRef.update({followingCount: admin.firestore.FieldValue.increment(-1), updatedAt: now}),
                targetRef.update({followerCount: admin.firestore.FieldValue.increment(-1), updatedAt: now}),
            ]);

            return res.status(200).json({
                success: true,
                message: "언팔로우 완료",
                data: {isFollowing: false},
            });
        } else {
            // 팔로우 처리
            await Promise.all([
                followingRef.set({followedAt: now}),
                followerRef.set({followedAt: now}),
                userRef.update({followingCount: admin.firestore.FieldValue.increment(1), updatedAt: now}),
                targetRef.update({followerCount: admin.firestore.FieldValue.increment(1), updatedAt: now}),
            ]);

            return res.status(200).json({
                success: true,
                message: "팔로우 완료",
                data: {isFollowing: true},
            });
        }
    } catch (e) {
        console.error("toggleFollow error:", e);
        return res.status(500).json({success: false, message: "서버 오류 발생"});
    }
});
