import {onRequest} from "firebase-functions/https";
import * as admin from "firebase-admin";
import {verifyAuth} from "../utils/auth";

const db = admin.firestore();

export const updateUserProfile = onRequest({ cors: true }, async (req, res: any) => {
    if (req.method !== 'POST') {
        return res.status(405).json({
            success: false,
            reason: 'method',
            message: 'Method not allowed',
        });
    }

    try {
        // 🔐 인증 확인
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const { nickname, intro, avatarUrl } = req.body;

        if (!nickname) {
            return res.status(400).json({
                success: false,
                reason: 'nickname',
                message: '닉네임은 필수입니다.',
            });
        }

        const userRef = db.collection('users').doc(uid);

        // 업데이트할 필드 준비
        const updateData: any = {
            nickname,
            intro: intro ?? '',
            avatarUrl: avatarUrl ?? '',
            updatedAt: admin.firestore.FieldValue.serverTimestamp(),
        };

        await userRef.update(updateData);

        const updatedSnap = await userRef.get();

        return res.status(200).json({
            success: true,
            message: '프로필이 성공적으로 수정되었습니다.',
            data: updatedSnap.data(),
        });
    } catch (error) {
        console.error('❌ updateUserProfile error:', error);
        return res.status(500).json({
            success: false,
            reason: 'server',
            message: '서버 오류로 인해 프로필 수정에 실패했습니다.',
        });
    }
});
