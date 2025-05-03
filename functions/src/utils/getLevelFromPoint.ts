export function getLevelFromPoint(point: number): number {
    if (point < 100) return 1;
    if (point < 300) return 2;
    if (point < 600) return 3;
    if (point < 1000) return 4;
    return 5; // 등급은 예시
}

export function getTitleFromLevel(level: number): string {
    switch (level) {
        case 1: return "입문자";
        case 2: return "초보자";
        case 3: return "중급자";
        case 4: return "고수";
        case 5: return "마스터";
        default: return "알 수 없음";
    }
}