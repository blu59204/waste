# Waste Wise - Smart Waste Classification App

A Flutter application for intelligent waste classification and environmental impact tracking.

## 🎨 Design Overview

The app has been completely redesigned with a modern, clean aesthetic featuring:

### Color Palette
- **Primary Green** (#7CB342) - Eco-friendly theme
- **Accent Gold** (#FFB74D) - Rewards and highlights  
- **Light Cream** (#F5F0E8) - Warm background
- **Warm Beige** (#D4A574) - Secondary accents
- **Dark Brown** (#6D4C41) - Text and UI elements

### Key Features
- ♻️ AI-powered waste classification
- 📊 Real-time statistics tracking
- 💰 Wallet system with rewards
- 👤 User profiles with achievements
- 🎯 Modern Material Design 3 UI

## 📱 Screens

### 1. Home Screen
- Welcome dashboard with personalized greeting
- Quick stats card showing total scans and CO₂ saved
- Quick action buttons for common tasks
- Recent activity feed

### 2. Stats Screen
- Overview cards with key metrics
- Waste breakdown by category with progress bars
- Environmental impact card showing trees saved, water conserved, and energy saved

### 3. Scan Screen
- Camera interface for waste classification
- Real-time scanning with progress indicator
- Classification results with confidence level
- Points earned display

### 4. Wallet Screen
- Balance display with WasteCoin tokens
- Quick actions (Send, Receive, Redeem)
- Transaction history with timestamps

### 5. Profile Screen
- User avatar and information
- Achievement badges system
- Settings and preferences
- Account management options

## 🏗️ Architecture

### State Management
The app uses the Provider pattern for state management with the following providers:

- **AuthProvider**: User authentication and session management
- **ClassificationProvider**: Waste classification logic and results
- **WalletProvider**: Balance tracking and transaction history
- **StatsProvider**: User statistics and environmental impact metrics

### Project Structure
```
lib/
├── config/
│   └── colors.dart           # App color palette
├── providers/
│   ├── auth_provider.dart
│   ├── classification_provider.dart
│   ├── wallet_provider.dart
│   └── stats_provider.dart
├── screens/
│   ├── home_screen.dart
│   ├── stats_screen.dart
│   ├── scan_screen.dart
│   ├── wallet_screen.dart
│   └── profile_screen.dart
└── main.dart                 # App entry point
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=2.12.0 <3.0.0)
- Dart SDK
- Android Studio / VS Code with Flutter plugins

### Installation

1. Clone the repository:
```bash
git clone https://github.com/blu59204/waste.git
cd waste
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Build for Production

Android APK:
```bash
flutter build apk --release
```

Android App Bundle:
```bash
flutter build appbundle --release
```

## 📦 Dependencies

- `flutter`: SDK
- `provider: ^6.0.0`: State management
- `clay_containers: ^1.0.0`: UI components

## 🎯 Current Implementation Status

✅ **Completed:**
- All screen layouts with Material Design 3
- Provider-based state management
- Custom bottom navigation
- Modern UI components with cards and gradients
- Responsive layouts
- Theme configuration

🔄 **In Progress:**
- Camera integration for scanning
- Backend API integration
- Real waste classification with ML
- Blockchain wallet integration

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📧 Contact

For questions or feedback, please open an issue on GitHub.

---

Built with ❤️ using Flutter
