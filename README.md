# ⏱️ StopWatch App

A simple, modern, and responsive stopwatch application built with **Flutter** and **Dart**. Track elapsed time with a clean user interface and smooth performance.

## 📱 Overview

StopWatch is a lightweight mobile application designed to provide essential stopwatch functionality without unnecessary complexity. It offers an intuitive interface with easy-to-use controls for measuring elapsed time.

## ✨ Features

- ▶️ **Start:** Start the stopwatch or resume timing.
- ⏸️ **Stop:** Pause the stopwatch while preserving elapsed time.
- 🔄 **Reset:** Stop the timer and reset the elapsed time to zero.
- ⏱️ **Live Timer:** Display elapsed time in minutes, seconds, and centiseconds.
- 🎨 **Modern UI:** Clean dark theme with a circular progress indicator.
- 📱 **Responsive Design:** Adapts to different screen sizes.
- ⚡ **Lightweight:** No external packages or database required.

## 🛠️ Built With

- **Flutter** — Cross-platform mobile application framework.
- **Dart** — Programming language.
- **Material Design 3** — Modern user interface components.
- **Dart Stopwatch** — Elapsed-time measurement.
- **Timer** — Periodic UI updates.

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio or Visual Studio Code
- An Android emulator or a physical device

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/youssefmohamedflutter/stop_watch.git
   ```

2. Navigate to the project directory:

   ```bash
   cd stop_watch
   ```

3. Install dependencies:

   ```bash
   flutter pub get
   ```

4. Run the application:

   ```bash
   flutter run
   ```

### Build APK

To generate a release APK for Android:

```bash
flutter build apk --release
```

The APK will be generated at:

`build/app/outputs/flutter-apk/app-release.apk`

## 📂 Project Structure

```text
stop_watch/
├── android/
├── ios/
├── lib/
│   └── main.dart
├── test/
├── pubspec.yaml
├── analysis_options.yaml
└── README.md
```

## 🎯 How It Works

The application uses Dart's built-in `Stopwatch` class to measure elapsed time accurately. A periodic timer refreshes the user interface to display the latest elapsed time.

- **Start:** Begins or resumes the stopwatch.
- **Stop:** Pauses time measurement without losing the elapsed duration.
- **Reset:** Clears the elapsed duration and returns the stopwatch to its initial state.

The timer is properly stopped and disposed of when the screen is removed, helping prevent unnecessary background updates.

## 🔒 Privacy & Storage

- No account or login required.
- No external API required.
- No database or persistent storage.
- No additional permissions required for core functionality.

## 🔮 Future Improvements

- Light and dark theme options.
- Lap time tracking.
- Customizable timer appearance.

## 👨‍💻 Developer

**Youssef Mohamed**  
Flutter Mobile Developer

- GitHub: [@youssefmohamedflutter](https://github.com/youssefmohamedflutter)

## 📄 License

This project is available for educational and portfolio purposes. Add a license file if you intend to distribute it under specific open-source terms.

---

**Built with Flutter ❤️**
