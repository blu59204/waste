# 🗂️ Waste Wise - Complete Technical Deep Dive & Implementation Guide

## 📋 Table of Contents
1. [Project Overview & Vision](#project-overview--vision)
2. [Technical Architecture](#technical-architecture)
3. [Core Technologies & Dependencies](#core-technologies--dependencies)
4. [Application Flow & User Journey](#application-flow--user-journey)
5. [AI/ML Implementation](#aiml-implementation)
6. [Web3/Blockchain Integration](#web3blockchain-integration)
7. [Firebase Backend Services](#firebase-backend-services)
8. [State Management & Data Flow](#state-management--data-flow)
9. [UI/UX Design System](#uiux-design-system)
10. [Security & Performance](#security--performance)
11. [Development Setup & Configuration](#development-setup--configuration)
12. [Deployment & Distribution](#deployment--distribution)
13. [Future Roadmap & Scalability](#future-roadmap--scalability)

---

## 🎯 Project Overview & Vision

### **Mission Statement**
Waste Wise transforms waste management from a mundane chore into an engaging, rewarding experience by combining artificial intelligence, blockchain technology, and gamification to create a sustainable future.

### **Core Value Proposition**
- **Real AI Classification**: Instant waste identification using TensorFlow Lite
- **Blockchain Rewards**: Earn WasteCoin tokens for environmental actions
- **Social Impact**: Track real carbon footprint reduction
- **Gamified Experience**: Points, badges, challenges, and community features
- **Educational Platform**: Learn proper disposal methods and eco-friendly practices

### **Target Demographics**
```
Primary Users (60%):
- Age: 18-35, environmentally conscious millennials/Gen-Z
- Tech-savvy individuals interested in crypto/Web3
- Urban residents with access to recycling facilities

Secondary Users (25%):
- Age: 35-50, families with environmental awareness
- Educators and students in sustainability programs
- Corporate sustainability coordinators

Early Adopters (15%):
- Crypto enthusiasts exploring utility tokens
- Environmental activists and influencers
- Beta testers and tech reviewers
```

---

## 🏗️ Technical Architecture

### **High-Level System Design**
```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Flutter App   │───▶│  Firebase Cloud │───▶│  Solana Devnet  │
│                 │    │                 │    │                 │
│ • UI/UX Layer   │    │ • Authentication│    │ • Wallet Service│
│ • State Mgmt    │    │ • Firestore DB  │    │ • Token Rewards │
│ • Camera/ML     │    │ • Cloud Storage │    │ • Transactions  │
│ • Local Storage │    │ • Analytics     │    │ • NFT Metadata  │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         ▼                       ▼                       ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│ TensorFlow Lite │    │   Web3Auth SDK  │    │  External APIs  │
│                 │    │                 │    │                 │
│ • Waste Model   │    │ • Social Login  │    │ • Google Maps   │
│ • Inference     │    │ • Key Mgmt      │    │ • Token Registry│
│ • Preprocessing │    │ • Session Mgmt  │    │ • Price Feeds   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### **Modular Architecture Breakdown**

#### **Frontend Layer (Flutter)**
```dart
// Main app structure
├── Presentation Layer
│   ├── Screens (30+ screens)
│   ├── Widgets (Reusable components)
│   ├── Themes (Material Design 3)
│   └── Navigation (GoRouter)
├── Business Logic Layer
│   ├── Providers (State management)
│   ├── Services (Core functionality)
│   ├── Models (Data structures)
│   └── Utils (Helper functions)
└── Data Layer
    ├── Local Storage (Secure + Prefs)
    ├── Remote APIs (Firebase + Solana)
    ├── ML Models (TensorFlow Lite)
    └── Cache Management
```

#### **Backend Services**
```yaml
Firebase Services:
  - Authentication: Multi-provider auth (Email, Google, etc.)
  - Firestore: Real-time user data and stats
  - Storage: Profile images and app assets
  - Crashlytics: Error reporting and monitoring
  - Analytics: User behavior tracking
  - Messaging: Push notifications

Web3 Infrastructure:
  - Web3Auth: Social login to crypto wallet
  - Solana RPC: Blockchain interaction
  - Token Program: SPL token management
  - Metaplex: NFT metadata standard
```

---

## 🛠️ Core Technologies & Dependencies

### **Flutter Dependencies Analysis**

#### **Core Framework & Navigation**
```yaml
flutter: sdk
go_router: ^16.2.4          # Declarative routing
provider: ^6.0.5            # State management
get_it: ^8.0.2              # Dependency injection
```

#### **Firebase Integration Stack**
```yaml
firebase_core: ^4.2.0       # Firebase initialization
firebase_auth: ^6.1.1       # User authentication
cloud_firestore: ^6.0.3     # Real-time database
firebase_storage: ^13.0.3   # File storage
firebase_crashlytics: ^5.0.1 # Error reporting
firebase_analytics: ^12.0.3  # User analytics
firebase_messaging: ^16.0.3  # Push notifications
firebase_data_connect: ^0.2.1+1 # GraphQL-like queries
```

#### **Web3 & Blockchain Stack**
```yaml
web3auth_flutter: ^6.3.0    # Social login to crypto
solana: ^0.31.0             # Solana blockchain client
web3dart: ^2.7.3           # Ethereum compatibility
bip39: ^1.0.6               # Mnemonic generation
ed25519_hd_key: ^2.2.0      # Solana key derivation
flutter_secure_storage: ^9.2.2 # Encrypted key storage
```

#### **AI/ML & Camera Stack**
```yaml
tflite_flutter: ^0.11.0     # TensorFlow Lite runtime
camera: ^0.11.0+1           # Camera access
image: ^4.2.0               # Image processing
image_picker: ^1.0.4        # Gallery selection
permission_handler: ^12.0.1  # Runtime permissions
```

#### **UI/UX & Animation Stack**
```yaml
google_fonts: ^6.2.1        # Custom typography
dynamic_color: ^1.1.5       # Material You colors
fl_chart: ^1.1.1            # Data visualization
flutter_speed_dial: ^7.0.0  # FAB with options
video_player: ^2.8.2        # Loading animations
```

#### **Utilities & Tools**
```yaml
flutter_dotenv: ^6.0.0      # Environment variables
shared_preferences: ^2.2.2   # Local key-value store
local_auth: ^2.3.0          # Biometric authentication
url_launcher: ^6.3.2        # External URLs
geolocator: ^14.0.2         # Location services
google_maps_flutter: ^2.5.0 # Maps integration
hex: ^0.2.0                 # Hex string utilities
```

### **Development Tools**
```yaml
flutter_lints: ^6.0.0       # Code quality rules
flutter_test: sdk           # Unit testing framework
```

---

## 🔄 Application Flow & User Journey

### **Detailed User Journey Map**

#### **1. App Launch & Initialization**
```
App Start → Loading Video → Service Initialization
    ↓
Check Authentication State:
├── Firebase User Found? → Home Dashboard
├── Web3Auth Session? → Wallet Recovery → Home Dashboard  
├── Local Wallet Exists? → Biometric Auth → Home Dashboard
└── No Authentication → Welcome Screen
```

#### **2. Authentication Flow**
```
Welcome Screen
    ↓
Choose Authentication Method:
├── Social Login (Google/Twitter/Facebook)
│   └── Web3Auth → Generate Solana Wallet → Profile Setup
├── Email/Password
│   ├── Firebase Auth → Optional Wallet Creation
│   └── Passwordless Email → Web3Auth → Wallet Setup
└── Local Wallet (Offline)
    └── Generate Ed25519 Keypair → Secure Storage
```

#### **3. Onboarding Experience**
```
Profile Setup → Camera Permissions → Location Access
    ↓
Interactive Tutorial:
├── Scan Demo Item → AI Classification Demo
├── Points System Explanation
├── Wallet Overview → Airdrop Demo (Devnet)
└── Community Features Preview
    ↓
Complete Onboarding → Home Dashboard
```

#### **4. Core App Experience**
```
Home Dashboard
├── Quick Scan → Classification Screen
├── Statistics → Progress Tracking
├── Community → Challenges & Leaderboard
├── Wallet → Web3 Features
└── Profile → Settings & Achievements

Classification Flow:
Scan Item → Camera Preview → Capture → ML Processing
    ↓
Results Display:
├── Waste Type & Confidence
├── Disposal Instructions  
├── Eco-Tips
├── Points Earned
└── Confirm/Retry Options
    ↓
Points Added → Stats Updated → Achievement Check
```

#### **5. Gamification Loop**
```
Action Completed → Points Earned → Progress Updated
    ↓
Achievement System:
├── Milestone Badges (10, 50, 100 scans)
├── Category Badges (All waste types)
├── Streak Badges (Daily scanning)
├── Impact Badges (Carbon saved)
└── Social Badges (Community challenges)
    ↓
Leaderboard Update → Social Sharing → Community Engagement
```

#### **6. Web3 Integration**
```
Wallet Dashboard → Token Balances → Transaction History
    ↓
Available Actions:
├── Send SOL/Tokens → Address Input → Confirmation
├── Receive → QR Code Generation
├── Request Airdrop (Devnet) → Balance Update
├── Token Details → Price Info & Metadata
└── NFT Collection → Achievement Badges
    ↓
Transaction Broadcast → Network Confirmation → Balance Refresh
```

---

## 🤖 AI/ML Implementation

### **TensorFlow Lite Model Architecture**

#### **Model Specifications**
```yaml
Model Type: MobileNetV2-based CNN
Input Shape: [1, 224, 224, 3] (RGB images)
Output Shape: [1, 12] (12 waste categories)
Model Size: ~10MB optimized for mobile
Quantization: INT8 for faster inference
Platform: Cross-platform (Android/iOS)
```

#### **Waste Categories & Classification**
```dart
enum WasteCategory {
  battery,      // Hazardous waste
  biodegradable, // Compostable organic
  cardboard,    // Recyclable paper
  clothes,      // Textile recycling
  diapers,      // Non-recyclable
  ewaste,       // Electronic waste
  glass,        // Fully recyclable
  medical,      // Hazardous disposal
  metal,        // High-value recyclable
  paper,        // Recyclable cellulose
  plastic,      // Various recyclability
  shoes,        // Textile/rubber recycling
}
```

#### **Classification Service Implementation**
```dart
class ClassificationService {
  // Background processing with isolates
  Future<WasteItem> classifyImage(File imageFile) async {
    // Run heavy processing in background isolate
    final result = await compute(_classifyImageInIsolate, {
      'imagePath': imageFile.path,
      'labels': _labels,
    });
    
    // Create WasteItem with full metadata
    return WasteItem(
      name: result['label'],
      confidence: result['confidence'],
      disposalInstructions: _getDisposalInstructions(result['label']),
      tips: _getTips(result['label']),
      points: _getPoints(result['label']),
      recyclable: _isRecyclable(result['label']),
      // ... additional metadata
    );
  }

  // Isolate function for ML processing
  static Future<Map<String, dynamic>> _classifyImageInIsolate(
    Map<String, dynamic> params
  ) async {
    // Load and preprocess image (224x224 normalization)
    final input = _preprocessImageInIsolate(imageFile);
    
    // Load TensorFlow Lite model
    final interpreter = await Interpreter.fromAsset('assets/model.tflite');
    
    // Run inference
    final output = List.filled(numClasses, 0.0).reshape([1, numClasses]);
    interpreter.run(input, output);
    
    // Process results
    return _processPredictions(output[0]);
  }
}
```

#### **Image Preprocessing Pipeline**
```dart
// Optimized preprocessing for mobile inference
List<List<List<List<double>>>> _preprocessImageInIsolate(File imageFile) {
  // Decode image
  final image = img.decodeImage(imageFile.readAsBytesSync());
  
  // Resize to model input size (224x224)
  final resizedImage = img.copyResize(image, width: 224, height: 224);
  
  // Normalize to [-1, 1] range for MobileNet
  final normalizedInput = List.generate(1, (i) =>
    List.generate(224, (j) =>
      List.generate(224, (k) =>
        List.generate(3, (l) {
          final pixel = resizedImage.getPixel(k, j);
          switch (l) {
            case 0: return (pixel.r - 127.5) / 127.5; // Red
            case 1: return (pixel.g - 127.5) / 127.5; // Green  
            case 2: return (pixel.b - 127.5) / 127.5; // Blue
          }
        })
      )
    )
  );
  
  return normalizedInput;
}
```

#### **Disposal Instructions & Tips System**
```dart
// Comprehensive waste disposal guidance
Map<String, WasteGuidance> wasteGuidance = {
  'plastic': WasteGuidance(
    disposalInstructions: '''
      1. Check recycling symbol (1-7 on bottom)
      2. Rinse clean of food residue
      3. Remove caps and labels if required
      4. Place in designated recycling bin
      5. Avoid crushing bottles (maintains value)
    ''',
    tips: [
      'Reduce single-use plastics when possible',
      'Look for products with minimal packaging',
      'Reuse containers for storage',
      'Support brands using recycled plastic',
    ],
    carbonImpact: 0.7, // kg CO2 saved per item
    points: 8,
    recyclable: true,
  ),
  // ... comprehensive guidance for all 12 categories
};
```

---

## 🔗 Web3/Blockchain Integration

### **Web3Auth Social Authentication**

#### **Configuration & Setup**
```dart
class WalletWeb3AuthConfig {
  static const String clientId = 'BPi5PB_UiIZ...'; // From Web3Auth Dashboard
  static const Web3AuthNetwork web3AuthNetwork = Web3AuthNetwork.sapphire_devnet;
  static const String redirectUri = 'wasteapp://auth';
  static const String appName = 'Waste Wise';
  static const int sessionTime = 86400; // 24 hours
  
  // Social login providers
  static final loginProviders = {
    'google': LoginConfigItem(
      verifier: "google",
      typeOfLogin: TypeOfLogin.google,
      clientId: EnvironmentConfig.googleSignInClientId,
    ),
    'twitter': LoginConfigItem(
      verifier: "twitter",
      typeOfLogin: TypeOfLogin.twitter,
    ),
    'facebook': LoginConfigItem(
      verifier: "facebook", 
      typeOfLogin: TypeOfLogin.facebook,
    ),
  };
}
```

#### **Wallet Service Architecture**
```dart
class WalletService extends ChangeNotifier {
  // Core state
  WalletState _state = const WalletState();
  SolanaClient? _solanaClient;
  Ed25519HDKeyPair? _keyPair;
  
  // Authentication methods
  Future<bool> loginWithGoogle() async => _login(Provider.google);
  Future<bool> loginWithEmail(String email) async => _login(
    Provider.email_passwordless,
    extraOptions: ExtraLoginOptions(login_hint: email),
  );
  
  // Local wallet fallback for offline use
  Future<bool> createAndUseLocalWallet({String? email}) async {
    final walletData = await createLocalWallet();
    final userInfo = {
      'name': email?.split('@')[0] ?? 'Local User',
      'email': email ?? 'local@wallet.app',
      'verifier': 'local',
    };
    await _initializeWallet(walletData.privKeyHex, userInfo);
    return true;
  }
  
  // Solana blockchain operations
  Future<String?> sendSol(String toAddress, double amount) async {
    final lamports = (amount * lamportsPerSol).toInt();
    return await _solanaClient!.transferLamports(
      source: _keyPair!,
      destination: Ed25519HDPublicKey.fromBase58(toAddress),
      lamports: lamports,
    );
  }
  
  Future<bool> requestAirdrop() async {
    await _solanaClient!.requestAirdrop(
      address: _keyPair!.publicKey,
      lamports: lamportsPerSol, // 1 SOL
    );
    await Future.delayed(const Duration(seconds: 3));
    await immediateRefresh();
    return true;
  }
}
```

### **Solana Blockchain Integration**

#### **Network Configuration**
```dart
class SolanaNetworkConfig {
  // Devnet configuration for testing
  static const String rpcUrl = 'https://api.devnet.solana.com';
  static const String wsUrl = 'wss://api.devnet.solana.com/';
  
  // Token program addresses
  static const String tokenProgramId = 'TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA';
  static const String wasteWiseTokenMint = 'Your_Custom_Token_Mint_Address';
  
  // Transaction fees and limits
  static const int maxRetries = 3;
  static const Duration timeoutDuration = Duration(seconds: 30);
}
```

#### **Token Balance & Metadata Fetching**
```dart
Future<Map<String, TokenInfo>> _fetchTokenBalances(String address) async {
  // Direct RPC call for SPL token accounts
  final response = await http.post(
    Uri.parse(SolanaNetworkConfig.rpcUrl),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode({
      'jsonrpc': '2.0',
      'id': 1,
      'method': 'getTokenAccountsByOwner',
      'params': [
        address,
        {'programId': 'TokenkegQfeZyiNwAJbNbGKPFXCWuBvf9Ss623VQ5DA'},
        {'encoding': 'jsonParsed'}
      ]
    }),
  );
  
  final tokenInfos = <String, TokenInfo>{};
  
  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    final tokenAccounts = data['result']['value'] as List;
    
    for (final account in tokenAccounts) {
      final parsedData = account['account']['data']['parsed']['info'];
      final mint = parsedData['mint']?.toString() ?? '';
      final tokenAmount = parsedData['tokenAmount'];
      final amount = double.tryParse(tokenAmount['amount'] ?? '0') ?? 0.0;
      final decimals = int.tryParse(tokenAmount['decimals']?.toString() ?? '0') ?? 0;
      
      // Convert from raw amount to decimal
      final decimalAmount = amount / math.pow(10, decimals);
      
      if (decimalAmount > 0) {
        // Fetch token metadata
        final metadata = await _fetchTokenMetadata(mint);
        
        tokenInfos[mint] = TokenInfo(
          mint: mint,
          balance: decimalAmount,
          name: metadata['name'] ?? 'Unknown Token',
          symbol: metadata['symbol'] ?? 'UNK',
          decimals: decimals,
          logoUri: metadata['logoURI'],
        );
      }
    }
  }
  
  return tokenInfos;
}
```

#### **WasteCoin Reward System**
```dart
class WasteCoinService {
  static const double correctClassificationReward = 0.001; // SOL
  static const double challengeCompletionReward = 0.005; // SOL
  static const double dailyStreakBonus = 0.002; // SOL
  
  Future<bool> rewardForCorrectClassification({
    required String wasteType,
    required bool isCorrect,
  }) async {
    if (!isCorrect) return false;
    
    try {
      // Calculate reward based on waste type complexity
      final baseReward = correctClassificationReward;
      final typeMultiplier = _getWasteTypeMultiplier(wasteType);
      final finalReward = baseReward * typeMultiplier;
      
      // Award tokens through smart contract or direct transfer
      return await _awardTokens(finalReward);
    } catch (e) {
      debugPrint('Error awarding WasteCoin: $e');
      return false;
    }
  }
  
  double _getWasteTypeMultiplier(String wasteType) {
    switch (wasteType.toLowerCase()) {
      case 'ewaste':
      case 'battery':
        return 2.0; // Higher reward for hazardous waste
      case 'metal':
      case 'glass':
        return 1.5; // Good reward for high-value recyclables
      case 'paper':
      case 'cardboard':
      case 'plastic':
        return 1.0; // Standard reward
      default:
        return 0.8; // Lower reward for non-recyclables
    }
  }
}
```

---

## 🔥 Firebase Backend Services

### **Authentication System**

#### **Multi-Provider Authentication**
```dart
class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Email/password authentication
  Future<UserProfile?> createUserWithEmailAndPassword(
    String name, String email, String password
  ) async {
    try {
      final credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      // Update profile with display name
      await credential.user?.updateDisplayName(name);
      
      // Create user profile document
      final userProfile = UserProfile(
        uid: credential.user!.uid,
        fullName: name,
        email: email,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      
      // Save to Firestore
      await _saveUserProfile(userProfile);
      
      return userProfile;
    } on FirebaseAuthException catch (e) {
      throw _handleAuthException(e);
    }
  }
  
  // Google Sign-In integration
  Future<UserProfile?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) return null;
      
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      
      final userCredential = await _auth.signInWithCredential(credential);
      return _createUserProfileFromFirebase(userCredential.user!);
    } catch (e) {
      throw 'Google sign-in failed: ${e.toString()}';
    }
  }
}
```

### **Real-time Database Schema**

#### **Firestore Collections Structure**
```yaml
# User Profiles Collection
/users/{userId}:
  uid: string
  fullName: string
  email: string
  bio: string
  profileImageUrl: string?
  walletAddress: string?
  createdAt: timestamp
  updatedAt: timestamp
  preferences:
    notifications: boolean
    darkMode: boolean
    language: string
  
# User Statistics Collection  
/user_stats/{userId}:
  totalScans: number
  ecoPoints: number
  achievementsUnlocked: number
  totalAchievements: number
  carbonSaved: number (kg CO2)
  wasteTypeScans: map<string, number>
  lastUpdated: timestamp
  streakDays: number
  
# Scan History Collection
/scan_history/{scanId}:
  userId: string
  wasteType: string
  confidence: number
  pointsEarned: number
  carbonSaved: number
  timestamp: timestamp
  imageUrl: string?
  location: geopoint?
  
# Challenges Collection
/challenges/{challengeId}:
  title: string
  description: string
  type: string (daily|weekly|milestone)
  requirements: map
  rewards: map
  startDate: timestamp
  endDate: timestamp
  active: boolean
  
# Leaderboard Collection (Updated via Cloud Functions)
/leaderboard/{period}: # daily, weekly, monthly, all-time
  rankings: array<{
    userId: string
    displayName: string
    points: number
    rank: number
  }>
  lastUpdated: timestamp
```

#### **Real-time Stats Service**
```dart
class UserStatsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Stream for real-time updates
  Stream<UserStats> getUserStatsStream() {
    final user = _auth.currentUser;
    if (user == null) return Stream.value(UserStats());
    
    return _firestore
        .collection('user_stats')
        .doc(user.uid)
        .snapshots()
        .map((doc) {
      if (!doc.exists) return UserStats();
      return UserStats.fromFirestore(doc);
    });
  }
  
  // Atomic scan recording with transaction
  Future<void> recordScan({
    required String wasteType,
    int pointsEarned = 10,
    double carbonSaved = 0.5,
  }) async {
    final user = _auth.currentUser;
    if (user == null) return;
    
    final statsRef = _firestore.collection('user_stats').doc(user.uid);
    
    await _firestore.runTransaction((transaction) async {
      final snapshot = await transaction.get(statsRef);
      
      UserStats currentStats = snapshot.exists 
          ? UserStats.fromFirestore(snapshot)
          : UserStats();
      
      // Update waste type tracking
      final updatedWasteTypeScans = Map<String, int>.from(currentStats.wasteTypeScans);
      updatedWasteTypeScans[wasteType] = (updatedWasteTypeScans[wasteType] ?? 0) + 1;
      
      // Create updated stats
      final updatedStats = currentStats.copyWith(
        totalScans: currentStats.totalScans + 1,
        ecoPoints: currentStats.ecoPoints + pointsEarned,
        carbonSaved: currentStats.carbonSaved + carbonSaved,
        wasteTypeScans: updatedWasteTypeScans,
      );
      
      transaction.set(statsRef, updatedStats.toFirestore());
    });
    
    // Check achievements asynchronously
    _checkAndAwardAchievements();
  }
}
```

### **Cloud Functions & Backend Logic**

#### **Leaderboard Update Function (Node.js)**
```javascript
const functions = require('firebase-functions');
const admin = require('firebase-admin');

exports.updateLeaderboard = functions.pubsub
  .schedule('every 1 hours')
  .onRun(async (context) => {
    const db = admin.firestore();
    
    // Get all user stats
    const statsSnapshot = await db.collection('user_stats').get();
    const rankings = [];
    
    statsSnapshot.forEach(doc => {
      const data = doc.data();
      rankings.push({
        userId: doc.id,
        displayName: data.displayName || 'Anonymous',
        points: data.ecoPoints || 0,
        totalScans: data.totalScans || 0,
        carbonSaved: data.carbonSaved || 0,
      });
    });
    
    // Sort by points (descending)
    rankings.sort((a, b) => b.points - a.points);
    
    // Add rank numbers
    rankings.forEach((user, index) => {
      user.rank = index + 1;
    });
    
    // Update leaderboard document
    await db.collection('leaderboard').doc('all-time').set({
      rankings: rankings.slice(0, 100), // Top 100
      lastUpdated: admin.firestore.FieldValue.serverTimestamp(),
    });
    
    console.log('Leaderboard updated successfully');
  });
```

---

## 🎯 State Management & Data Flow

### **Provider Architecture**

#### **AppStateProvider - Global App State**
```dart
class AppStateProvider extends ChangeNotifier {
  // Authentication state
  bool _isAuthenticated = false;
  bool _isLoading = false;
  UserProfile? _currentUser;
  String? _errorMessage;
  
  // Services
  final WalletService _walletService = WalletService.instance;
  final FirebaseAuthService _firebaseService = FirebaseAuthService();
  
  // Authentication flow
  Future<void> initializeAuthenticationState() async {
    _isLoading = true;
    notifyListeners();
    
    try {
      // 1. Check stored authentication
      await _loadStoredAuthState();
      
      // 2. Check Firebase authentication
      if (_firebaseService.isFirebaseAvailable) {
        final firebaseUser = _firebaseService.currentUser;
        if (firebaseUser != null) {
          await _setUserWithPersistence(
            _createUserFromFirebase(firebaseUser), 
            'firebase'
          );
          return;
        }
      }
      
      // 3. Check Web3Auth/Wallet state
      await _walletService.initialize();
      if (_walletService.state.isLoggedIn) {
        await _setUserWithPersistence(
          _createUserFromWallet(_walletService.state),
          'wallet'
        );
        return;
      }
      
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Unified authentication methods
  Future<bool> authenticateWithWallet(String email) async {
    setLoading(true);
    
    final success = await _walletService.loginWithEmail(email);
    if (success) {
      final user = _createUserFromWallet(_walletService.state);
      await _setUserWithPersistence(user, 'wallet');
    } else {
      setError(_walletService.state.error ?? 'Authentication failed');
    }
    
    setLoading(false);
    return success;
  }
}
```

#### **NavigationProvider - App Navigation**
```dart
class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  final List<String> _navigationHistory = [];
  
  // Bottom navigation
  void setSelectedIndex(int index) {
    _selectedIndex = index;
    _navigationHistory.add(_routeNames[index]);
    notifyListeners();
  }
  
  // Navigation helpers
  void navigateToHome() => setSelectedIndex(0);
  void navigateToStats() => setSelectedIndex(1);
  void navigateToScan() => setSelectedIndex(2);
  void navigateToWallet() => setSelectedIndex(3);
  
  // Back navigation
  bool canGoBack() => _navigationHistory.length > 1;
  void goBack() {
    if (canGoBack()) {
      _navigationHistory.removeLast();
      final previousRoute = _navigationHistory.last;
      final index = _routeNames.indexOf(previousRoute);
      if (index != -1) {
        _selectedIndex = index;
        notifyListeners();
      }
    }
  }
}
```

### **Data Flow Patterns**

#### **Unidirectional Data Flow**
```
User Action → Provider Method → Service Layer → External API
    ↓              ↓              ↓              ↓
UI Update ← notifyListeners() ← State Update ← Response Processing
```

#### **Example: Waste Scanning Flow**
```dart
// 1. User taps scan button
onPressed: () async {
  // 2. Trigger classification
  final wasteItem = await classificationService.classifyImage(imageFile);
  
  // 3. Update local state
  setState(() {
    _classifiedWasteItem = wasteItem;
  });
  
  // 4. Record in Firebase (async)
  userStatsService.recordScan(
    wasteType: wasteItem.name,
    pointsEarned: wasteItem.points,
    carbonSaved: wasteItem.carbonImpact,
  );
  
  // 5. Trigger wallet reward (async)
  wasteCoinService.rewardForCorrectClassification(
    wasteType: wasteItem.name,
    isCorrect: true,
  );
}
```

---

## 🎨 UI/UX Design System

### **Material Design 3 Implementation**

#### **Color System**
```dart
class AppTheme {
  // Primary brand colors
  static const Color primaryBlue = Color(0xFF1976D2);
  static const Color primaryPurple = Color(0xFF7C4DFF);
  static const Color successGreen = Color(0xFF4CAF50);
  static const Color warningOrange = Color(0xFFFF9800);
  static const Color warningYellow = Color(0xFFFFEB3B);
  static const Color errorRed = Color(0xFFF44336);
  static const Color errorPink = Color(0xFFE91E63);
  
  // Neutral palette
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF6B6B6B);
  static const Color surfacePrimary = Color(0xFFFFFFFF);
  static const Color surfaceSecondary = Color(0xFFF5F5F5);
  
  // Corner radius system
  static const BorderRadius cornerRadiusSmall = BorderRadius.all(Radius.circular(8));
  static const BorderRadius cornerRadiusMedium = BorderRadius.all(Radius.circular(16));
  static const BorderRadius cornerRadiusLarge = BorderRadius.all(Radius.circular(24));
}
```

#### **Typography Scale**
```dart
class DesignTokens {
  // Typography scale
  static const TextStyle displayLarge = TextStyle(
    fontSize: 57,
    fontWeight: FontWeight.w400,
    letterSpacing: -0.25,
  );
  
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w600,
    letterSpacing: 0,
  );
  
  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w500,
    letterSpacing: 0,
  );
  
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.15,
  );
  
  static const TextStyle labelLarge = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );
}
```

### **Glass Morphism Components**

#### **Optimized Glass Card**
```dart
class OptimizedGlassCard extends StatelessWidget {
  final Widget child;
  final double borderRadius;
  final double blur;
  final double opacity;
  final Border? border;
  final EdgeInsetsGeometry padding;
  
  const OptimizedGlassCard({
    Key? key,
    required this.child,
    this.borderRadius = 16,
    this.blur = 10,
    this.opacity = 0.2,
    this.border,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadius),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
          child: Container(
            padding: padding,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(opacity),
              borderRadius: BorderRadius.circular(borderRadius),
              border: border ?? Border.all(
                color: Colors.white.withOpacity(0.3),
                width: 1,
              ),
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}
```

#### **Gradient Button Components**
```dart
class GradientButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final List<Color> colors;
  final VoidCallback onPressed;
  final double height;
  final double borderRadius;
  
  const GradientButton({
    Key? key,
    required this.text,
    required this.colors,
    required this.onPressed,
    this.icon,
    this.height = 50,
    this.borderRadius = 12,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: colors),
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: [
          BoxShadow(
            color: colors[0].withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, color: Colors.white, size: 20),
                const SizedBox(width: 8),
              ],
              Text(
                text,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

### **Responsive Layout System**

#### **Adaptive Grid Layouts**
```dart
class ResponsiveGrid extends StatelessWidget {
  final List<Widget> children;
  final double maxWidth;
  
  const ResponsiveGrid({
    Key? key,
    required this.children,
    this.maxWidth = 1200,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        int columns = 1;
        if (constraints.maxWidth > 600) columns = 2;
        if (constraints.maxWidth > 900) columns = 3;
        if (constraints.maxWidth > 1200) columns = 4;
        
        return GridView.count(
          crossAxisCount: columns,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.2,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          children: children,
        );
      },
    );
  }
}
```

#### **Animated Loading States**
```dart
class ShimmerLoading extends StatefulWidget {
  final double width;
  final double height;
  final BorderRadius borderRadius;
  
  const ShimmerLoading({
    Key? key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  }) : super(key: key);
  
  @override
  State<ShimmerLoading> createState() => _ShimmerLoadingState();
}

class _ShimmerLoadingState extends State<ShimmerLoading>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat();
    
    _animation = Tween<double>(begin: -1, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            borderRadius: widget.borderRadius,
            gradient: LinearGradient(
              begin: Alignment(-1 + _animation.value, 0),
              end: Alignment(_animation.value, 0),
              colors: [
                Colors.grey[300]!,
                Colors.grey[100]!,
                Colors.grey[300]!,
              ],
            ),
          ),
        );
      },
    );
  }
  
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
```

---

## 🔒 Security & Performance

### **Security Implementation**

#### **Private Key Management**
```dart
class SecureStorageService {
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage(
    aOptions: AndroidOptions(
      encryptedSharedPreferences: true,
      sharedPreferencesName: 'waste_wise_secure',
      preferencesKeyPrefix: 'ww_',
    ),
    iOptions: IOSOptions(
      groupId: 'group.com.wastewise.app',
      accountName: 'waste_wise_keychain',
      accessibility: IOSAccessibility.first_unlock_this_device,
    ),
  );
  
  // Store sensitive data
  static Future<void> storePrivateKey(String key, String value) async {
    await _secureStorage.write(
      key: key,
      value: value,
      aOptions: const AndroidOptions(
        encryptedSharedPreferences: true,
      ),
    );
  }
  
  // Retrieve with error handling
  static Future<String?> getPrivateKey(String key) async {
    try {
      return await _secureStorage.read(key: key);
    } catch (e) {
      debugPrint('Error reading from secure storage: $e');
      return null;
    }
  }
  
  // Clear all sensitive data
  static Future<void> clearAllKeys() async {
    await _secureStorage.deleteAll();
  }
}
```

#### **Input Validation & Sanitization**
```dart
class ValidationUtils {
  // Email validation
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  // Wallet address validation
  static bool isValidSolanaAddress(String address) {
    try {
      // Solana addresses are base58 encoded and 32-44 characters
      if (address.length < 32 || address.length > 44) return false;
      
      // Check base58 character set
      final base58Regex = RegExp(r'^[1-9A-HJ-NP-Za-km-z]+$');
      return base58Regex.hasMatch(address);
    } catch (e) {
      return false;
    }
  }
  
  // Sanitize user input
  static String sanitizeInput(String input) {
    return input
        .trim()
        .replaceAll(RegExp(r'[<>"\']'), '') // Remove dangerous characters
        .replaceAll(RegExp(r'\s+'), ' '); // Normalize whitespace
  }
  
  // Amount validation for transactions
  static bool isValidAmount(String amount, double maxAmount) {
    try {
      final parsedAmount = double.parse(amount);
      return parsedAmount > 0 && parsedAmount <= maxAmount;
    } catch (e) {
      return false;
    }
  }
}
```

#### **Error Handling & Recovery**
```dart
class ErrorHandler {
  static void handleError(
    dynamic error,
    StackTrace? stackTrace, {
    String? context,
    bool fatal = false,
  }) {
    // Log error locally
    if (kDebugMode) {
      debugPrint('Error in $context: $error');
      debugPrint('Stack trace: $stackTrace');
    }
    
    // Report to Firebase Crashlytics
    FirebaseService.instance.recordError(
      error,
      stackTrace,
      fatal: fatal,
    );
    
    // User-friendly error messages
    String userMessage = _getUserFriendlyMessage(error);
    
    // Show error to user if not fatal
    if (!fatal) {
      _showErrorDialog(userMessage);
    }
  }
  
  static String _getUserFriendlyMessage(dynamic error) {
    final errorString = error.toString().toLowerCase();
    
    if (errorString.contains('network') || errorString.contains('connection')) {
      return 'Please check your internet connection and try again.';
    } else if (errorString.contains('timeout')) {
      return 'The request timed out. Please try again.';
    } else if (errorString.contains('permission')) {
      return 'Permission required. Please check app settings.';
    } else if (errorString.contains('storage')) {
      return 'Storage error. Please restart the app.';
    } else {
      return 'Something went wrong. Please try again.';
    }
  }
}
```

### **Performance Optimizations**

#### **Image Processing Optimization**
```dart
class ImageOptimizer {
  // Compress images before ML processing
  static Future<File> compressImage(File imageFile) async {
    final bytes = await imageFile.readAsBytes();
    final image = img.decodeImage(bytes);
    
    if (image == null) throw Exception('Invalid image');
    
    // Resize if too large
    img.Image resized = image;
    if (image.width > 800 || image.height > 600) {
      resized = img.copyResize(
        image,
        width: math.min(800, image.width),
        height: math.min(600, image.height),
      );
    }
    
    // Compress with quality setting
    final compressedBytes = img.encodeJpg(resized, quality: 85);
    
    // Write to temporary file
    final tempDir = await getTemporaryDirectory();
    final compressedFile = File('${tempDir.path}/compressed_${DateTime.now().millisecondsSinceEpoch}.jpg');
    await compressedFile.writeAsBytes(compressedBytes);
    
    return compressedFile;
  }
  
  // Memory-efficient thumbnail generation
  static Future<Uint8List> generateThumbnail(File imageFile, {int size = 150}) async {
    final bytes = await imageFile.readAsBytes();
    final image = img.decodeImage(bytes);
    
    if (image == null) throw Exception('Invalid image');
    
    final thumbnail = img.copyResize(image, width: size, height: size);
    return Uint8List.fromList(img.encodeJpg(thumbnail, quality: 70));
  }
}
```

#### **Memory Management**
```dart
class MemoryManager {
  static final List<StreamSubscription> _subscriptions = [];
  static final List<AnimationController> _controllers = [];
  static final List<Timer> _timers = [];
  
  // Register resources for cleanup
  static void registerSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }
  
  static void registerController(AnimationController controller) {
    _controllers.add(controller);
  }
  
  static void registerTimer(Timer timer) {
    _timers.add(timer);
  }
  
  // Cleanup all registered resources
  static void cleanup() {
    // Cancel subscriptions
    for (final subscription in _subscriptions) {
      subscription.cancel();
    }
    _subscriptions.clear();
    
    // Dispose animation controllers
    for (final controller in _controllers) {
      controller.dispose();
    }
    _controllers.clear();
    
    // Cancel timers
    for (final timer in _timers) {
      timer.cancel();
    }
    _timers.clear();
    
    if (kDebugMode) {
      debugPrint('Memory cleanup completed');
    }
  }
}
```

#### **Network Request Optimization**
```dart
class NetworkOptimizer {
  static final http.Client _client = http.Client();
  static final Map<String, CachedResponse> _cache = {};
  
  // Cached HTTP requests with TTL
  static Future<http.Response> cachedGet(
    String url, {
    Duration cacheDuration = const Duration(minutes: 5),
    Map<String, String>? headers,
  }) async {
    final cacheKey = '$url${headers?.toString() ?? ''}';
    final cached = _cache[cacheKey];
    
    // Return cached response if valid
    if (cached != null && DateTime.now().isBefore(cached.expiry)) {
      return cached.response;
    }
    
    // Make network request
    final response = await _client.get(
      Uri.parse(url),
      headers: headers,
    );
    
    // Cache successful responses
    if (response.statusCode == 200) {
      _cache[cacheKey] = CachedResponse(
        response: response,
        expiry: DateTime.now().add(cacheDuration),
      );
    }
    
    return response;
  }
  
  // Batch multiple requests
  static Future<List<http.Response>> batchRequests(
    List<String> urls, {
    Map<String, String>? headers,
  }) async {
    final futures = urls.map((url) => _client.get(
      Uri.parse(url),
      headers: headers,
    ));
    
    return await Future.wait(futures);
  }
}

class CachedResponse {
  final http.Response response;
  final DateTime expiry;
  
  CachedResponse({required this.response, required this.expiry});
}
```

---

## ⚙️ Development Setup & Configuration

### **Environment Configuration**

#### **Required API Keys & Services**
```bash
# .env file template
# Firebase Configuration
FIREBASE_API_KEY=your_firebase_api_key
FIREBASE_APP_ID=your_firebase_app_id
FIREBASE_PROJECT_ID=your_firebase_project_id
FIREBASE_STORAGE_BUCKET=your_firebase_storage_bucket
FIREBASE_MESSAGING_SENDER_ID=your_messaging_sender_id

# Web3Auth Configuration
WEB3AUTH_CLIENT_ID=your_web3auth_client_id

# Google Services
GOOGLE_SIGNIN_CLIENT_ID=your_google_signin_client_id
GOOGLE_MAPS_API_KEY=your_google_maps_api_key

# Solana Network
SOLANA_RPC_URL=https://api.devnet.solana.com
SOLANA_WS_URL=wss://api.devnet.solana.com/

# Custom Token Configuration
WASTE_WISE_TOKEN_MINT=your_custom_token_mint_address

# Performance Settings
BALANCE_REFRESH_INTERVAL=30
MAX_CACHE_SIZE=100
CLASSIFICATION_TIMEOUT=5000
```

#### **Setup Script**
```bash
#!/bin/bash
# setup.sh - Development environment setup

echo "🚀 Setting up Waste Wise development environment..."

# Check Flutter installation
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter not found. Please install Flutter SDK first."
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -n 1)"

# Check Flutter version
FLUTTER_VERSION=$(flutter --version | grep -oE '[0-9]+\.[0-9]+\.[0-9]+' | head -n 1)
REQUIRED_VERSION="3.5.3"

if ! [ "$(printf '%s\n' "$REQUIRED_VERSION" "$FLUTTER_VERSION" | sort -V | head -n1)" = "$REQUIRED_VERSION" ]; then 
    echo "❌ Flutter version $FLUTTER_VERSION is too old. Required: $REQUIRED_VERSION"
    exit 1
fi

# Create .env file if it doesn't exist
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file from template..."
    cp env.template .env
    echo "⚠️  Please update .env with your API keys before running the app"
fi

# Install dependencies
echo "📦 Installing Flutter dependencies..."
flutter pub get

# Run code generation
echo "🔧 Running code generation..."
flutter packages pub run build_runner build --delete-conflicting-outputs

# Check for required files
if [ ! -f "android/app/google-services.json" ]; then
    echo "⚠️  Missing android/app/google-services.json"
    echo "   Please download from Firebase Console"
fi

if [ ! -f "assets/model.tflite" ]; then
    echo "⚠️  Missing assets/model.tflite"
    echo "   Please add your trained TensorFlow Lite model"
fi

if [ ! -f "assets/labels.txt" ]; then
    echo "⚠️  Missing assets/labels.txt"
    echo "   Please add model labels file"
fi

echo "✅ Setup complete!"
echo "🔧 Next steps:"
echo "   1. Update .env with your API keys"
echo "   2. Add google-services.json to android/app/"
echo "   3. Add TensorFlow Lite model to assets/"
echo "   4. Run: flutter run"
```

### **Development Commands**

#### **Build & Run Scripts**
```bash
# Development
flutter run --debug                    # Debug build
flutter run --profile                  # Profile build  
flutter run --release                  # Release build

# Testing
flutter test                           # Unit tests
flutter test integration_test/         # Integration tests
flutter analyze                        # Static analysis

# Code Generation
flutter packages pub run build_runner build
flutter packages pub run build_runner watch

# APK Building
flutter build apk --release            # Release APK
flutter build apk --debug              # Debug APK
flutter build appbundle --release      # App Bundle for Play Store
```

#### **Quality Assurance**
```yaml
# analysis_options.yaml
include: package:flutter_lints/flutter.yaml

analyzer:
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
  
linter:
  rules:
    # Styling
    always_declare_return_types: true
    always_specify_types: false
    avoid_unnecessary_containers: true
    prefer_const_constructors: true
    prefer_const_literals_to_create_immutables: true
    
    # Error Prevention
    avoid_print: true
    avoid_web_libraries_in_flutter: true
    cancel_subscriptions: true
    close_sinks: true
    
    # Performance
    avoid_function_literals_in_foreach_calls: true
    prefer_for_elements_to_map_fromiterable: true
```

### **Testing Strategy**

#### **Unit Tests**
```dart
// test/services/classification_service_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:waste_classifier_flutter/services/classification_service_optimized.dart';

void main() {
  group('ClassificationService', () {
    late ClassificationService service;
    
    setUp(() {
      service = ClassificationService();
    });
    
    test('should load model successfully', () async {
      await service.loadModel();
      expect(service.isModelLoaded, true);
    });
    
    test('should classify waste item correctly', () async {
      // Create mock image file
      final mockImage = File('test/assets/plastic_bottle.jpg');
      
      final result = await service.classifyImage(mockImage);
      
      expect(result.name, 'Plastic');
      expect(result.confidence, greaterThan(0.7));
      expect(result.recyclable, true);
      expect(result.points, greaterThan(0));
    });
    
    test('should provide disposal instructions', () {
      final instructions = service.getDisposalInstructions('Plastic');
      expect(instructions, isNotEmpty);
      expect(instructions, contains('recycling'));
    });
  });
}
```

#### **Widget Tests**
```dart
// test/widgets/glass_card_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:waste_classifier_flutter/widgets/shared/optimized_glass_card.dart';

void main() {
  group('OptimizedGlassCard', () {
    testWidgets('should render with correct styling', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: OptimizedGlassCard(
              blur: 10,
              opacity: 0.2,
              child: Text('Test Content'),
            ),
          ),
        ),
      );
      
      expect(find.text('Test Content'), findsOneWidget);
      expect(find.byType(BackdropFilter), findsOneWidget);
      expect(find.byType(ClipRRect), findsAtLeastNWidgets(1));
    });
  });
}
```

#### **Integration Tests**
```dart
// integration_test/app_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:waste_classifier_flutter/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  
  group('App Integration Tests', () {
    testWidgets('complete user journey', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      
      // Test authentication flow
      expect(find.text('Welcome to Waste Wise'), findsOneWidget);
      
      await tester.tap(find.text('Get Started'));
      await tester.pumpAndSettle();
      
      // Test navigation
      expect(find.byType(BottomNavigationBar), findsOneWidget);
      
      // Test scanning flow
      await tester.tap(find.text('Scan Waste'));
      await tester.pumpAndSettle();
      
      expect(find.byType(CameraPreview), findsOneWidget);
    });
  });
}
```

---

## 🚀 Deployment & Distribution

### **Build Configuration**

#### **Android Build Settings**
```gradle
// android/app/build.gradle
android {
    compileSdk 34
    ndkVersion "25.1.8937393"
    
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_17
        targetCompatibility JavaVersion.VERSION_17
    }
    
    defaultConfig {
        applicationId "com.wastewise.waste_classifier_flutter"
        minSdk 21
        targetSdk 34
        versionCode flutterVersionCode.toInteger()
        versionName flutterVersionName
        
        multiDexEnabled true
        
        // Proguard configuration
        proguardFiles getDefaultProguardFile('proguard-android-optimize.txt'), 'proguard-rules.pro'
    }
    
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
        debug {
            applicationIdSuffix ".debug"
            debuggable true
        }
    }
}

// Automatic APK copy task
task copyApkToRoot {
    doLast {
        copy {
            from 'build/outputs/apk/release/'
            into '../../'
            include '*.apk'
            rename 'app-release.apk', 'waste-wise-v${android.defaultConfig.versionName}.apk'
        }
        println "APK copied to project root"
    }
}

tasks.whenTaskAdded { task ->
    if (task.name == 'assembleRelease') {
        task.finalizedBy copyApkToRoot
    }
}
```

#### **Proguard Configuration**
```proguard
# android/app/proguard-rules.pro

# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }

# TensorFlow Lite
-keep class org.tensorflow.lite.** { *; }
-keep class org.tensorflow.lite.gpu.** { *; }

# Web3Auth
-keep class com.web3auth.** { *; }

# Solana
-keep class com.solana.** { *; }

# Firebase
-keep class com.google.firebase.** { *; }
-keep class com.google.android.gms.** { *; }

# Keep data classes
-keep class * extends java.io.Serializable { *; }
-keepclassmembers class * extends java.io.Serializable {
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}
```

### **Release Process**

#### **Automated Release Pipeline**
```yaml
# .github/workflows/release.yml
name: Release Build

on:
  push:
    tags:
      - 'v*'

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - uses: actions/setup-java@v3
      with:
        distribution: 'zulu'
        java-version: '17'
    
    - uses: subosito/flutter-action@v2
      with:
        flutter-version: '3.5.3'
        
    - name: Install dependencies
      run: flutter pub get
      
    - name: Run tests
      run: flutter test
      
    - name: Run static analysis
      run: flutter analyze
      
    - name: Build APK
      run: flutter build apk --release --build-name=${{ github.ref_name }} --build-number=${{ github.run_number }}
      
    - name: Build App Bundle
      run: flutter build appbundle --release --build-name=${{ github.ref_name }} --build-number=${{ github.run_number }}
      
    - name: Create Release
      uses: actions/create-release@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        tag_name: ${{ github.ref }}
        release_name: Waste Wise ${{ github.ref }}
        draft: false
        prerelease: false
        
    - name: Upload APK
      uses: actions/upload-release-asset@v1
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        upload_url: ${{ steps.create_release.outputs.upload_url }}
        asset_path: build/outputs/apk/release/app-release.apk
        asset_name: waste-wise-${{ github.ref_name }}.apk
        asset_content_type: application/vnd.android.package-archive
```

#### **Play Store Deployment**
```bash
# Generate signed App Bundle
flutter build appbundle --release

# Upload to Play Console
# 1. Go to Google Play Console
# 2. Select your app
# 3. Release → Production → Create new release
# 4. Upload build/outputs/bundle/release/app-release.aab
# 5. Add release notes
# 6. Review and publish

# Release notes template
# Version 1.0.0
# 
# 🎉 Initial Release
# • AI-powered waste classification
# • Web3 wallet integration
# • Real-time statistics tracking
# • Gamification with points and badges
# • Community challenges and leaderboard
# 
# 🛠 Technical Features
# • TensorFlow Lite ML model
# • Solana blockchain integration
# • Firebase real-time database
# • Material Design 3 UI
```

### **Distribution Channels**

#### **Direct APK Distribution**
```bash
# Generate production APK
flutter build apk --release --split-per-abi

# APK variants generated:
# - app-arm64-v8a-release.apk (64-bit ARM)
# - app-armeabi-v7a-release.apk (32-bit ARM)  
# - app-x86_64-release.apk (64-bit x86)

# Universal APK (larger size, all architectures)
flutter build apk --release
```

#### **Progressive Web App (PWA)**
```bash
# Build web version
flutter build web --release

# Deploy to Firebase Hosting
firebase init hosting
firebase deploy

# Or deploy to Netlify/Vercel
# Upload build/web/ directory to hosting service
```

---

## 🔮 Future Roadmap & Scalability

### **Phase 2: Enhanced Features**

#### **Advanced AI Capabilities**
```yaml
Planned Enhancements:
- Multi-object detection (detect multiple items in one image)
- Damage assessment (condition-based recycling recommendations)
- Brand recognition (specific product disposal instructions)
- Real-time video classification (continuous scanning mode)
- Edge AI optimization (on-device model training)

Technical Implementation:
- Upgrade to TensorFlow Lite 2.x with GPU acceleration
- Implement YOLOv8 for object detection
- Add custom training pipeline for brand recognition
- Integrate with Google ML Kit for enhanced capabilities
```

#### **Blockchain Expansion**
```yaml
Multi-Chain Support:
- Ethereum mainnet integration
- Polygon for low-fee transactions
- BSC (Binance Smart Chain) support
- Cross-chain bridge implementation

DeFi Integration:
- Staking mechanisms for WasteCoin
- Liquidity pools for token trading
- NFT marketplace for environmental badges
- DAO governance for community decisions

Smart Contracts:
- Automated reward distribution
- Reputation system on-chain
- Carbon credit tokenization
- Supply chain tracking
```

#### **IoT & Hardware Integration**
```yaml
Smart Bin Integration:
- IoT sensors for automatic waste detection
- Weight-based reward calculation
- Fill-level monitoring and notifications
- Blockchain-verified disposal records

Hardware Partnerships:
- Smart scale integration for accurate measurements
- Camera modules for automated sorting
- QR code generation for disposal tracking
- Municipal waste management integration
```

### **Phase 3: Enterprise & Government**

#### **B2B Solutions**
```yaml
Corporate Dashboard:
- Company-wide sustainability metrics
- Employee engagement leaderboards
- ESG reporting integration
- Custom branding and white-label options

Municipal Integration:
- City-wide waste tracking
- Route optimization for collection
- Public awareness campaigns
- Policy impact measurement

Educational Platforms:
- School program integration
- Curriculum-aligned content
- Teacher dashboards and analytics
- Student progress tracking
```

#### **API & Developer Ecosystem**
```yaml
Public APIs:
- Classification API for third-party apps
- Waste data analytics API
- Reward system API
- Environmental impact calculator API

SDK Development:
- React Native SDK for cross-platform apps
- Unity SDK for game development
- Web SDK for browser applications
- Arduino/Raspberry Pi libraries for IoT

Developer Portal:
- API documentation and playground
- Code samples and tutorials
- Community forum and support
- Revenue sharing for successful integrations
```

### **Scalability Architecture**

#### **Backend Infrastructure**
```yaml
Microservices Migration:
- Classification service (containerized ML inference)
- User management service (authentication & profiles)
- Blockchain service (Web3 operations)
- Analytics service (data processing & insights)
- Notification service (push notifications & emails)

Database Scaling:
- Firebase Firestore regional replication
- Read replicas for analytics queries
- Time-series database for metrics (InfluxDB)
- Redis cache for frequently accessed data
- CDN for static assets and images

Message Queues:
- Pub/Sub for asynchronous processing
- Dead letter queues for failed operations
- Event sourcing for audit trails
- Real-time updates via WebSocket
```

#### **Performance Optimization**
```yaml
Client-Side Optimizations:
- Progressive image loading
- Intelligent caching strategies
- Background sync for offline operations
- Lazy loading for heavy components

Server-Side Optimizations:
- Edge computing for ML inference
- Geographic load balancing
- Auto-scaling based on demand
- Cost optimization with reserved instances

Monitoring & Analytics:
- Real-time error tracking (Sentry)
- Performance monitoring (New Relic)
- User analytics (Firebase Analytics)
- Custom dashboards (Grafana)
```

### **Business Model Evolution**

#### **Revenue Streams**
```yaml
Freemium Model:
- Basic classification (free, 10 scans/day)
- Premium subscription (unlimited + advanced features)
- Enterprise licenses (white-label solutions)
- API usage fees (pay-per-classification)

Token Economics:
- WasteCoin utility token for rewards
- Premium features unlocked with tokens
- Staking rewards for long-term holders
- Governance voting rights for token holders

Partnership Revenue:
- Municipal contracts for waste management
- Corporate sustainability programs
- Educational institution licenses
- Hardware manufacturer integrations

Data Monetization:
- Anonymized waste pattern analytics
- Environmental impact reports
- Market research for recycling industry
- Policy recommendation services
```

#### **Global Expansion**
```yaml
Localization Strategy:
- Multi-language support (20+ languages)
- Regional waste classification differences
- Local disposal guideline integration
- Currency and payment method localization

Market Entry:
- Pilot programs in developing countries
- Partnership with environmental NGOs
- Government collaboration for policy support
- Academic research partnerships

Compliance & Regulation:
- GDPR compliance for European markets
- CCPA compliance for California
- Regional data residency requirements
- Environmental reporting standards
```

---

## 📊 Technical Metrics & KPIs

### **Performance Benchmarks**

#### **App Performance Targets**
```yaml
Launch Performance:
- Cold start time: < 3 seconds
- Warm start time: < 1 second
- Time to interactive: < 2 seconds
- Memory usage: < 150MB average

ML Classification:
- Inference time: < 500ms
- Model accuracy: > 92% on test set
- Model size: < 15MB
- GPU acceleration: 3x faster on supported devices

Network Performance:
- API response time: < 200ms (95th percentile)
- Image upload time: < 5 seconds (10MB image)
- Offline functionality: Core features work without internet
- Sync time after reconnection: < 30 seconds

Battery Optimization:
- Background processing: < 5% battery drain per hour
- Camera usage: Optimized with low-resolution preview
- Location services: Efficient GPS usage with caching
- Screen wake locks: Minimal and time-limited
```

#### **Business Metrics**
```yaml
User Engagement:
- Daily Active Users (DAU): Target 70% of MAU
- Session duration: Average 5-8 minutes
- Scans per session: Average 3-5 items
- Retention rate: 60% after 7 days, 40% after 30 days

Environmental Impact:
- Total items classified: Track cumulative count
- Carbon footprint reduced: Measured in kg CO2
- Recycling rate improvement: Before/after comparison
- Waste diversion from landfills: Tonnage tracked

Token Economics:
- WasteCoin distribution: Track reward allocation
- Token circulation: Active vs. held tokens  
- Transaction volume: Daily/weekly trading activity
- Token utility usage: Feature unlock statistics
```

### **Monitoring & Observability**

#### **Error Tracking**
```dart
class MonitoringService {
  static void trackPerformance(String operation, Duration duration) {
    // Custom performance tracking
    FirebaseAnalytics.instance.logEvent(
      name: 'performance_metric',
      parameters: {
        'operation': operation,
        'duration_ms': duration.inMilliseconds,
        'device_info': _getDeviceInfo(),
      },
    );
  }
  
  static void trackUserAction(String action, Map<String, dynamic> properties) {
    // User behavior analytics
    FirebaseAnalytics.instance.logEvent(
      name: 'user_action',
      parameters: {
        'action': action,
        'timestamp': DateTime.now().millisecondsSinceEpoch,
        ...properties,
      },
    );
  }
  
  static void trackMLPerformance(
    String wasteType,
    double confidence,
    Duration inferenceTime,
  ) {
    // ML model performance tracking
    FirebaseAnalytics.instance.logEvent(
      name: 'ml_inference',
      parameters: {
        'waste_type': wasteType,
        'confidence': confidence,
        'inference_time_ms': inferenceTime.inMilliseconds,
        'model_version': '1.0.0',
      },
    );
  }
}
```

#### **Health Checks**
```dart
class HealthCheckService {
  static Future<Map<String, bool>> performHealthCheck() async {
    final results = <String, bool>{};
    
    // Firebase connectivity
    try {
      await FirebaseFirestore.instance.doc('health/check').get();
      results['firebase'] = true;
    } catch (e) {
      results['firebase'] = false;
    }
    
    // Solana RPC connectivity
    try {
      final client = SolanaClient(rpcUrl: Uri.parse(SolanaNetworkConfig.rpcUrl));
      await client.rpcClient.getSlot();
      results['solana_rpc'] = true;
    } catch (e) {
      results['solana_rpc'] = false;
    }
    
    // ML model availability
    try {
      await rootBundle.loadString('assets/labels.txt');
      results['ml_model'] = true;
    } catch (e) {
      results['ml_model'] = false;
    }
    
    // Web3Auth service
    try {
      // Basic Web3Auth initialization check
      results['web3auth'] = Web3AuthFlutter.isInitialized;
    } catch (e) {
      results['web3auth'] = false;
    }
    
    return results;
  }
}
```

---

## 🎯 Conclusion

**Waste Wise** represents a comprehensive, production-ready Flutter application that successfully bridges the gap between environmental sustainability and modern technology. By combining:

### **Technical Excellence**
- **AI/ML Integration**: Real TensorFlow Lite model with 12-category waste classification
- **Blockchain Innovation**: Full Solana integration with Web3Auth social authentication
- **Modern Architecture**: Clean, scalable codebase with proper separation of concerns
- **Performance Optimization**: Efficient memory usage, background processing, and caching

### **User Experience**
- **Intuitive Design**: Material Design 3 with glass morphism aesthetics
- **Gamification**: Points, badges, challenges, and social features drive engagement
- **Educational Value**: Comprehensive disposal instructions and environmental tips
- **Accessibility**: Multiple authentication options and offline capabilities

### **Environmental Impact**
- **Real-world Application**: Practical tool for improving recycling behavior
- **Measurable Results**: Carbon footprint tracking and environmental metrics
- **Community Building**: Social features encourage collective environmental action
- **Educational Platform**: Raises awareness about proper waste disposal

### **Business Viability**
- **Scalable Architecture**: Microservices-ready with clear upgrade paths
- **Multiple Revenue Streams**: Freemium model, enterprise solutions, and token economics
- **Global Potential**: Localization-ready with regulatory compliance considerations
- **Partnership Opportunities**: Municipal, corporate, and educational integrations

This project demonstrates how cutting-edge technology can be applied to solve real-world environmental challenges while creating an engaging user experience. The combination of AI classification, blockchain rewards, and social gamification creates a unique value proposition that addresses both individual behavior change and broader sustainability goals.

The codebase serves as an excellent reference for Flutter developers interested in:
- **Complex State Management** with Provider pattern
- **ML Integration** with TensorFlow Lite and background processing
- **Web3 Development** with Solana and Web3Auth
- **Firebase Integration** with real-time databases and authentication
- **Modern UI Development** with Material Design 3 and custom animations

**Waste Wise** is more than just an app—it's a platform for driving positive environmental change through technology innovation, community engagement, and practical utility.

---

## 📚 Additional Resources

### **Documentation Links**
- [Flutter Documentation](https://docs.flutter.dev/)
- [Firebase Documentation](https://firebase.google.com/docs)
- [TensorFlow Lite Documentation](https://www.tensorflow.org/lite)
- [Solana Documentation](https://docs.solana.com/)
- [Web3Auth Documentation](https://web3auth.io/docs/)
- [Material Design 3](https://m3.material.io/)

### **Community & Support**
- [Flutter Community](https://flutter.dev/community)
- [Firebase Community](https://firebase.blog/)
- [Solana Developer Discord](https://discord.gg/solana)
- [Web3Auth Community](https://discord.gg/web3auth)

### **Development Tools**
- [Flutter DevTools](https://docs.flutter.dev/development/tools/devtools/overview)
- [Firebase Console](https://console.firebase.google.com/)
- [Web3Auth Dashboard](https://dashboard.web3auth.io/)
- [Solana Explorer](https://explorer.solana.com/)

---

*Last updated: January 2025*
*Version: 1.0.0*
*License: MIT*