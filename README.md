# Flutter8 Workspace 🚀

Welcome to **Flutter8 Workspace**, a creative playground for building fun, interactive Flutter web projects! This repository is optimized for web performance and designed for seamless hosting using **Firebase Hosting**.

## 🌟 Overview

This project serves as a central hub for various Flutter web experiments. Whether it's micro-interactions, Lottie-powered animations, or responsive UI components, everything here is built with the web in mind.

### Key Features
- **Flutter Web Optimized:** Tailored configurations for smooth browser experiences.
- **Firebase Hosting:** Automated or manual deployment to Firebase's global CDN.
- **Lottie Animations:** Rich, vector-based animations for engaging UIs (see `MessageSection`).
- **Clean Architecture:** Organized into `core`, `data`, `presentation`, and `domain` for scalability.
- **Theming:** Centralized `AppTheme` with custom extensions for easy styling.

## 🚀 Getting Started

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (Stable channel recommended)
- [Firebase CLI](https://firebase.google.com/docs/cli) (for hosting)

### Running Locally
To run the project in your browser:
```bash
flutter run -d chrome
```

### ☁️ Firebase Hosting Deployment

1. **Build the web project:**
   ```bash
   flutter build web --release
   ```

2. **Initialize Firebase (if not already done):**
   ```bash
   firebase init hosting
   ```
   *Select the `build/web` directory when asked for your public directory.*

3. **Deploy:**
   ```bash
   firebase deploy --only hosting
   ```

## 📁 Project Structure

- `lib/core`: Constants, themes, and utility extensions.
- `lib/data`: Data sources and asset path management.
- `lib/presentation`: Widgets and screens (where the magic happens! ✨).
- `assets/`: Lottie files, images, and other resources.

## 🛠 Built With
- [Flutter](https://flutter.dev) - UI Toolkit
- [Firebase Hosting](https://firebase.google.com/docs/hosting) - Fast and secure web hosting
- [Lottie for Flutter](https://pub.dev/packages/lottie) - Vector animations

---
*Happy Coding! 💙*
