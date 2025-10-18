# Development Guide - Waste Wise App

## 📋 Overview

This document provides detailed information for developers working on the Waste Wise application.

## 🎨 Design System

### Color Scheme

The app uses a carefully selected color palette defined in `lib/config/colors.dart`:

```dart
primaryGreen: #7CB342   // Main brand color, used for buttons, active states
accentGold: #FFB74D     // Accent color for rewards, highlights
lightCream: #F5F0E8     // Background color
warmBeige: #D4A574      // Secondary accents
darkBrown: #6D4C41      // Text and UI elements
```

### Typography

- **Display**: Large headings (32px, bold)
- **Title**: Section headers (20-24px, bold)
- **Body**: Regular text (14-16px, regular/medium)
- **Caption**: Small text (10-12px, regular)

### Spacing System

- **XS**: 4px
- **S**: 8px
- **M**: 12px
- **L**: 16px
- **XL**: 20px
- **XXL**: 30px

### Border Radius

- **Small**: 10-12px (icons, small buttons)
- **Medium**: 16px (cards, inputs)
- **Large**: 20px (hero sections)

## 🏗️ Architecture

### State Management with Provider

The app uses the Provider pattern for state management. All providers extend `ChangeNotifier` and use `notifyListeners()` to update the UI.

#### Provider Responsibilities

**AuthProvider**
- User authentication state
- Login/logout functionality
- User profile data

**ClassificationProvider**
- Waste classification results
- Confidence scores
- Classification history

**WalletProvider**
- Balance management
- Transaction history
- Points earning/spending

**StatsProvider**
- Total scans tracking
- Carbon footprint calculation
- Waste category breakdown

### Screen Structure

Each screen follows a consistent pattern:

```dart
class ExampleScreen extends StatelessWidget {
  const ExampleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Access providers
    final provider = Provider.of<ExampleProvider>(context);
    
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // Screen content
            ],
          ),
        ),
      ),
    );
  }
}
```

## 🔧 Common UI Components

### Card Component Pattern

```dart
Container(
  padding: const EdgeInsets.all(20),
  decoration: BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(16),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  ),
  child: // Content
)
```

### Gradient Background Pattern

```dart
Container(
  decoration: BoxDecoration(
    gradient: LinearGradient(
      colors: [
        AppColors.primaryGreen,
        AppColors.primaryGreen.withOpacity(0.8)
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    borderRadius: BorderRadius.circular(20),
  ),
  child: // Content
)
```

### Icon Container Pattern

```dart
Container(
  width: 40,
  height: 40,
  decoration: BoxDecoration(
    color: AppColors.primaryGreen.withOpacity(0.1),
    borderRadius: BorderRadius.circular(10),
  ),
  child: Icon(
    Icons.example,
    color: AppColors.primaryGreen,
    size: 20,
  ),
)
```

## 📱 Screen Implementations

### Home Screen
- **Purpose**: Main dashboard with quick actions
- **Key Features**: Stats overview, quick actions, recent activity
- **Providers Used**: AuthProvider, StatsProvider

### Stats Screen
- **Purpose**: Detailed statistics and impact tracking
- **Key Features**: Waste breakdown, environmental impact metrics
- **Providers Used**: StatsProvider

### Scan Screen
- **Purpose**: Waste classification interface
- **Key Features**: Camera preview, classification results, points display
- **Providers Used**: ClassificationProvider, WalletProvider, StatsProvider

### Wallet Screen
- **Purpose**: Digital wallet for rewards
- **Key Features**: Balance display, transactions, quick actions
- **Providers Used**: WalletProvider

### Profile Screen
- **Purpose**: User profile and settings
- **Key Features**: Achievements, settings, account management
- **Providers Used**: AuthProvider, StatsProvider

## 🧪 Testing Guidelines

### Unit Tests
Create tests for all providers:

```dart
test('should add points to wallet', () {
  final wallet = WalletProvider();
  wallet.addPoints(10);
  expect(wallet.balance, 110.0);
});
```

### Widget Tests
Test individual screens and components:

```dart
testWidgets('home screen displays user name', (tester) async {
  await tester.pumpWidget(
    ChangeNotifierProvider(
      create: (_) => AuthProvider(),
      child: MaterialApp(home: HomeScreen()),
    ),
  );
  expect(find.text('Demo User'), findsOneWidget);
});
```

## 🚀 Build and Deploy

### Development Build
```bash
flutter run --debug
```

### Release Build
```bash
# Android APK
flutter build apk --release

# Android App Bundle (for Play Store)
flutter build appbundle --release
```

### Code Quality
```bash
# Format code
flutter format .

# Analyze code
flutter analyze

# Run tests
flutter test
```

## 📝 Coding Standards

### Naming Conventions
- **Classes**: PascalCase (e.g., `HomeScreen`)
- **Methods/Variables**: camelCase (e.g., `getUserData`)
- **Constants**: camelCase with const (e.g., `const primaryGreen`)
- **Files**: snake_case (e.g., `home_screen.dart`)

### Code Organization
- Keep files under 500 lines
- Extract complex widgets into separate files
- Use const constructors where possible
- Add meaningful comments for complex logic

### Best Practices
1. Always use `const` for immutable widgets
2. Prefer named parameters for better readability
3. Use `Key` parameter for stateful widgets
4. Handle loading and error states
5. Use proper null safety (`?`, `!`, `??`)

## 🐛 Debugging Tips

### Common Issues

**Provider Not Found**
```dart
// Solution: Wrap widget with ChangeNotifierProvider
ChangeNotifierProvider(
  create: (_) => ExampleProvider(),
  child: ExampleWidget(),
)
```

**Context Issues**
```dart
// Solution: Use Builder or listen: false
Provider.of<ExampleProvider>(context, listen: false)
```

**Hot Reload Not Working**
```bash
# Solution: Hot restart
flutter run
# Then press 'R' in terminal
```

## 📚 Resources

- [Flutter Documentation](https://flutter.dev/docs)
- [Provider Package](https://pub.dev/packages/provider)
- [Material Design 3](https://m3.material.io/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## 🤝 Contributing Workflow

1. Create a feature branch: `git checkout -b feature/new-feature`
2. Make changes and test thoroughly
3. Format and analyze code
4. Commit with descriptive messages
5. Push and create a pull request
6. Wait for code review

## 📞 Support

For questions or issues:
- Open an issue on GitHub
- Check existing documentation
- Review code comments
- Ask in development chat

---

Happy coding! 🚀
