import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  bool _isAuthenticated = false;
  String _userName = 'Guest User';
  String _userEmail = '';

  bool get isAuthenticated => _isAuthenticated;
  String get userName => _userName;
  String get userEmail => _userEmail;

  Future<bool> loginWithGoogle() async {
    // Simulate Google login
    await Future.delayed(Duration(seconds: 1));
    _isAuthenticated = true;
    _userName = 'Eco Warrior';
    _userEmail = 'user@example.com';
    notifyListeners();
    return true;
  }

  Future<bool> loginWithEmail(String email) async {
    // Simulate email login
    await Future.delayed(Duration(seconds: 1));
    _isAuthenticated = true;
    _userName = email.split('@')[0];
    _userEmail = email;
    notifyListeners();
    return true;
  }

  void logout() {
    _isAuthenticated = false;
    _userName = 'Guest User';
    _userEmail = '';
    notifyListeners();
  }
}
