import * as admin from 'firebase-admin';
import {onRequest} from "firebase-functions/https";
import {verifyAuth} from "../utils/auth";

const db = admin.firestore();

export const createUserProfile = onRequest({ cors: true }, async (req, res: any) => {
    if (req.method !== 'POST') {
        return res.status(405).json({
            success: false,
            message: 'Method Not Allowed',
        });
    }

    try {
        const decoded = await verifyAuth(req);
        const uid = decoded.uid;

        const { nickname, avatarUrl, intro } = req.body;

        if (!nickname) {
            return res.status(200).json({
                success: false,
                message: 'nickname is required.',
            });
        }

        const userRef = db.collection('users').doc(uid);
        const exists = (await userRef.get()).exists;

        if (exists) {
            return res.status(200).json({
                success: false,
                message: 'User profile already exists.',
            });
        }

        const now = admin.firestore.Timestamp.now();
        const userData = {
            uid,
            nickname,
            avatarUrl: avatarUrl ?? '',
            intro: intro ?? '',
            statusMessage: '', // 🔥 기본 포함
            level: 1,
            point: 0,
            title: '입문자',
            createdAt: now,
            updatedAt: now,
            followerCount: 0,
            followingCount: 0,
            questionCount: 0,
            correctRate: 0,
        };

        await userRef.set(userData);

        return res.status(200).json({
            success: true,
            message: '프로필 생성 완료',
            data: {
                uid: userData.uid,
                nickname: userData.nickname,
                avatarUrl: userData.avatarUrl,
                statusMessage: userData.statusMessage,
                createdAt: userData.createdAt,
            },
        });
    } catch (error) {
        console.error('❌ 인증 또는 처리 실패:', error);
        return res.status(401).json({
            success: false,
            message: error ?? 'Unauthorized',
        });
    }
});