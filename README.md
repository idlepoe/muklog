gsutil cors set cors.json gs://muklog.firebasestorage.app
.\gradlew signingReport
flutter pub run flutter_launcher_icons
flutter pub run build_runner build --delete-conflicting-outputs



flutter clean
flutter pub get
flutter build web --release
firebase deploy --only hosting
flutter build appbundle --release



shorebird release android
shorebird patch --platforms=android --release-version=1.0.0+1