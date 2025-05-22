# 🍱 진품먹품 (Muklog)

> 나만의 맛집 기록, 진짜 맛과 품격을 담다

**진품먹품 (Muklog)** 은 사용자가 방문한 맛집을 사진과 함께 기록하고, 위치 기반으로 저장할 수 있는  
**개인 맞춤형 맛집 다이어리 앱**입니다.

Flutter + Firebase 기반으로 제작되었으며, 상태관리는 GetX, OTA 업데이트는 Shorebird로 처리됩니다.

---

## 🌐 공식 서비스

- 🔗 웹버전: [https://muklog.web.app](https://muklog.web.app)
- 📱 Google Play: [진품먹품 앱 설치하기](https://play.google.com/store/apps/details?id=com.jylee.muklog)

---

## 🚀 주요 기능

- 📍 **위치 기반 맛집 기록**: 지도에서 위치 지정 후 저장
- 📸 **음식 사진 및 한줄평 업로드**
- 📂 **Firestore + Storage 기반 데이터 저장**
- ☁️ **Firebase Hosting + Cloud Functions 사용**

---

## 🛠️ 기술 스택

- **Flutter** (Dart)
- **Firebase**
    - Authentication
    - Firestore
    - Storage
    - 🔧 Cloud Functions
    - 🏠 Hosting
- [GetX](https://pub.dev/packages/get) – 상태관리 및 라우팅
- [Shorebird](https://pub.dev/packages/shorebird_code_push) – 코드 푸시 배포

---

## 🧑‍💻 시작하기

```bash
git clone https://github.com/yourname/muklog.git
cd muklog
flutter pub get
flutter run
