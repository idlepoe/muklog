import * as admin from 'firebase-admin';
import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";

const db = admin.firestore();
export const getUserProfile = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== 'GET' && req.method !== 'POST') {
        return res.status(405).json({
            success: false,
            reason: "method",
            message: "method not allowed",
        });
    }

    try {
        // 🔐 Firebase 토큰 인증
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const userSnap = await db.collection('users').doc(uid).get();

        if (!userSnap.exists) {
            return res.status(200).json({
                success: false,
                message: "User not found",
            });
        }

        return res.status(200).json({
            success: true,
            message: "프로필 취득 완료",
            data: userSnap.data()
        });
    } catch (error) {
        console.error('❌ getUserProfile error:', error);
        return res.status(401).json({error: error ?? 'Unauthorized'});
    }
});
