# C1 Hsch

**C1 Hsch** is a comprehensive Arabic-language learning application designed to help students prepare for the German C1 exam (Goethe-Zertifikat C1, TestDaF, or telc C1 Hochschule). 

## 🌟 Features

* **Reading Exercises (Leseverstehen):** Tailored reading comprehension sections specifically designed to simulate C1 level German exams.
* **Bilingual Interface:** Primary interface in Arabic to assist Arab speakers in understanding complex German concepts and instructions easily.
* **Cross-Platform:** Built to run smoothly on Web, Android, and iOS.
* **Modern Architecture:** Developed using Flutter, utilizing Riverpod for state management, GoRouter for robust navigation, and Hive for fast local storage.

## 🌐 Web Version

The web version of the application is hosted on **Cloudflare Pages** and updates automatically via GitHub (CI/CD). 

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- Dart SDK

### Installation

1. Clone the repository.
2. Install the required packages:
   ```bash
   flutter pub get
   ```
3. Run the application:
   ```bash
   flutter run
   ```

### 🛠️ Building for Web

To generate a production-ready web build:

```bash
flutter build web --release
```
