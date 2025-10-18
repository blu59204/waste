# Waste Wise - Clay 3D Theme App

A beautiful Flutter application for waste management with a 3D clay-themed UI design. This app helps users classify waste, earn eco points, and track their environmental impact through an engaging gamified experience.

## 🎨 Design Overview

The app features a complete redesign with a 3D clay/ceramic aesthetic inspired by the provided mockup images:

- **Color Palette**: Warm earth tones including beige (#E8D5C4), browns (#C4A484, #8B6F47), and green (#B8D4A8)
- **Components**: Clay-textured cards with realistic shadows and depth
- **Characters**: Friendly 3D character mascots throughout the app
- **Theme**: Environmental and eco-friendly visual language

## 📱 Features

### Authentication
- **Welcome Screen**: Login with Google or Email
- Beautiful animated character display
- Guest mode for quick access

### Home Screen
- **User Dashboard**: Displays eco points and carbon saved
- **3D Character**: Friendly environmental mascot
- **Quick Actions**: Fast access to scan, history, and tips
- **Waste Type Stats**: Track different waste categories scanned

### Scan & Classify
- **Camera Integration**: Real-time waste scanning
- **ML Classification**: AI-powered waste type identification
- **Results Display**: Shows waste type, confidence level, and disposal instructions
- **Eco Tips**: Helpful environmental tips for each waste type
- **Point Rewards**: Earn eco points for each scan

### Wallet
- **WasteCoin Balance**: Track your environmental rewards
- **Transaction History**: View all earning and spending activities
- **Actions**: Send, receive, and request airdrops (Devnet)
- **Golden Coin Display**: Beautiful animated coin icon

### Achievements & Stats
- **Badge System**: Unlock badges for milestones
- **Leaderboard**: Compete with other users
- **Community**: Connect with fellow eco-warriors
- **Trophy Display**: Gold, silver, and bronze achievements

### Profile
- **User Info**: Display name, email, and stats
- **Settings**: Manage notifications, language, and preferences
- **Privacy**: Access privacy policy and help
- **Logout**: Secure account management

## 🏗️ Architecture

### Project Structure
```
lib/
├── config/
│   ├── colors.dart          # Clay theme color palette
│   └── theme.dart           # Material Design 3 theme configuration
├── providers/
│   ├── auth_provider.dart   # Authentication state management
│   ├── classification_provider.dart  # Waste classification logic
│   ├── stats_provider.dart  # User statistics tracking
│   └── wallet_provider.dart # Wallet and transactions
├── screens/
│   ├── welcome_screen.dart  # Login/authentication screen
│   ├── home_screen.dart     # Main dashboard
│   ├── scan_screen.dart     # Camera/scanning interface
│   ├── scan_result_screen.dart  # Classification results
│   ├── wallet_screen.dart   # Wallet and transactions
│   ├── stats_screen.dart    # Achievements and leaderboard
│   └── profile_screen.dart  # User profile and settings
├── widgets/
│   └── clay_card.dart       # Reusable clay-themed components
└── main.dart                # App entry point
```

### State Management
- **Provider Pattern**: Used throughout for reactive state updates
- **Consumer Widgets**: Efficient rebuilding of UI components
- **Change Notifiers**: Real-time data synchronization

### Key Components

#### ClayCard
Reusable component with clay texture effect:
- Customizable padding, colors, and border radius
- Multi-layered shadows for 3D depth
- Smooth animations

#### ClayButton
Themed buttons with tactile appearance:
- Support for icons and custom colors
- Ripple effects on interaction
- Elevation shadows

#### ClayIconButton
Circular buttons for actions:
- Configurable size and colors
- Perfect for FABs and quick actions

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (>=2.12.0 <3.0.0)
- Android Studio / VS Code
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
```bash
git clone https://github.com/blu59204/waste.git
cd waste
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Run the app**
```bash
flutter run
```

### Build for Production

**Android APK**
```bash
flutter build apk --release
```

**Android App Bundle**
```bash
flutter build appbundle --release
```

**iOS**
```bash
flutter build ios --release
```

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  provider: ^6.0.0          # State management
  clay_containers: ^1.0.0   # Clay 3D theme support
```

## 🎯 Screens Overview

### 1. Welcome/Login Screen
- 3D character display
- Google and Email login options
- Guest mode access
- Animated entrance

### 2. Home Dashboard
- User's eco points counter
- Carbon saved tracker
- Quick action buttons
- Recent waste type scans
- Bottom navigation bar

### 3. Scan Screen
- Camera preview (placeholder)
- Tap-to-scan button
- Loading animations
- Auto-navigation to results

### 4. Scan Result Screen
- Waste item classification
- Confidence percentage
- Disposal instructions card
- Eco tips card
- Points earned display

### 5. Wallet Screen
- Total WasteCoin balance
- Send/Receive/Airdrop buttons
- Transaction history list
- Beautiful coin icon

### 6. Stats/Achievements Screen
- Badge grid (unlocked/locked)
- Community showcase
- Leaderboard with rankings
- Trophy display (Gold/Silver/Bronze)

### 7. Profile Screen
- User avatar and info
- Statistics summary
- Settings menu
- Logout button

## 🎨 Design Tokens

### Colors
```dart
// Primary colors
clayGreen: #B8D4A8
clayBeige: #E8D5C4
clayBrown: #C4A484
clayDarkBrown: #8B6F47

// Background
backgroundLight: #F5F0E8
backgroundGreen: #D4E8D4

// Accents
accentGold: #D4AF37
accentSilver: #C0C0C0
accentBronze: #CD7F32

// Buttons
buttonGreen: #6B9B65
buttonBeige: #D9C4B0
buttonBrown: #A67C52
```

### Typography
- **Font**: Poppins (system default fallback)
- **Sizes**: 12-40px range
- **Weights**: Regular (400), Medium (600), Bold (700)

### Spacing
- **Small**: 8-12px
- **Medium**: 16-24px
- **Large**: 32-48px

## 🔮 Future Enhancements

- [ ] Real camera integration with permission handling
- [ ] Actual TensorFlow Lite ML model integration
- [ ] Firebase backend for real user data
- [ ] Web3 wallet integration with Solana
- [ ] Push notifications for achievements
- [ ] Social sharing features
- [ ] Multi-language support
- [ ] Dark mode variant
- [ ] Animated character interactions
- [ ] Sound effects and haptic feedback

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👥 Authors

- Initial design and implementation based on mockup images
- Clay 3D theme inspired by environmental aesthetics

## 🙏 Acknowledgments

- Design inspiration from the provided mockup images
- Flutter and Provider communities
- Environmental awareness initiatives

---

**Note**: This is a complete redesign from scratch, removing all old theme screens and implementing a fresh 3D clay aesthetic that matches the provided design mockups exactly.
