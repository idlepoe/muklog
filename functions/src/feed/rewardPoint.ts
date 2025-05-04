// functions/src/feed/createFeed.ts
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";
import {onRequest} from "firebase-functions/https";

export const rewardPoint = onRequest({cors: true}, async (req, res: any) => {
    if (req.method !== "POST") {
        return res.status(405).json({success: false, message: "Method Not Allowed"});
    }

    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;
        const {point} = req.body;

        if (typeof point !== "number") {
            return res.status(400).json({success: false, message: "Invalid point value"});
        }

        const userRef = admin.firestore().collection("users").doc(uid);
        const userSnap = await userRef.get();

        if (!userSnap.exists) {
            return res.status(404).json({success: false, message: "User not found"});
        }

        const currentPoint = userSnap.data()?.point ?? 0;
        const newPoint = currentPoint + point;

        await userRef.update({
            point: newPoint,
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        });

        return res.status(200).json({
            success: true,
            message: `${point}포인트 적립 완료`,
            data: {currentPoint: newPoint},
        });
    } catch (e) {
        console.error("rewardPoint error", e);
        return res.status(500).json({success: false, message: "서버 오류 발생"});
    }
});
