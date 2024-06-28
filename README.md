# 🚀 Flutter Notifications Showcase

Explore seamless notification management with this Flutter project, showcasing advanced capabilities using GetX for state management and MVVM architecture. Switch effortlessly between OneSignal and FCM providers across iOS, Android, and web platforms, ensuring optimal user engagement and real-time updates.

## Features

- **Efficient State Management**: Utilizes GetX for streamlined and reactive state management.
- **Structured MVVM Architecture**: Organized into Model-View-ViewModel for clear separation of concerns.
- **Flexible Notification Handling**: Easily switch between OneSignal and FCM for diverse notification scenarios.
- **Cross-Platform Compatibility**: Supports iOS, Android, and web, ensuring broad platform coverage.

## How This Helps

This project serves as a comprehensive learning resource and practical example for developers:
- **Learn GetX**: Understand how to implement GetX for scalable and maintainable Flutter applications.
- **Notification Integration**: Master integration techniques for OneSignal and FCM, crucial for modern app engagement strategies.
- **Cross-Platform Consistency**: Ensure consistent behavior across different platforms with shared codebase principles.
- **Customization and Extension**: Easily adapt and extend functionalities to meet specific project requirements.

## Installation

1. Clone the repository.
2. Ensure Flutter is installed and configured.
3. Run `flutter pub get` to install dependencies.

### iOS Configuration

- **Info.plist**:
  Add the following keys to your `Info.plist` file, located in `ios/Runner/Info.plist`:

  ```xml
  <key>OneSignalAppId</key>
  <string>YOUR_ONESIGNAL_APP_ID</string>
  <key>OneSignalRequiresUserPrivacyConsent</key>
  <false/>

- **Replace** YOUR_ONESIGNAL_APP_ID with your actual OneSignal App ID.

### Android Configuration

- **AndroidManifest.xml**:
    Update your `AndroidManifest.xml` file located in `android/app/src/main/AndroidManifest.xml` to include the following permissions and services:

    ```xml
    <!-- Required permissions -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.WAKE_LOCK"/>

    <!-- Firebase Cloud Messaging (FCM) service -->
    <service
        android:name=".MyFirebaseMessagingService"
        android:exported="false">
        <intent-filter>
            <action android:name="com.google.firebase.MESSAGING_EVENT"/>
        </intent-filter>
    </service>

    <!-- OneSignal service -->
    <service
        android:name="com.onesignal.GcmIntentService"
        android:exported="false">
        <intent-filter>
            <action android:name="com.google.android.c2dm.intent.RECEIVE"/>
        </intent-filter>
    </service>

## Usage

- Customize notification handling logic in `lib/services/notifications_service.dart`.
- Explore and modify the MVVM structure in `lib/controllers/home_controller.dart` for additional features.

## Contributing

Contributions are welcomed! Fork the repository, create your feature branch, commit your changes, and open a pull request.

## License

This project is licensed under the MIT License.

### About the Developer 🌟

- **👨‍💻Mo'men M.** is passionate about creating efficient and user-friendly mobile applications. With expertise in Flutter and Firebase, Mo'men focuses on delivering robust solutions that enhance user experiences and meet business objectives.
