import 'package:flutter/foundation.dart';

class AuthProvider extends ChangeNotifier {
  bool _isAuthenticated = false;
  String? _userName;
  String? _userEmail;

  bool get isAuthenticated => _isAuthenticated;
  String? get userName => _userName;
  String? get userEmail => _userEmail;

  Future<void> login(String email, String password) async {
    // Simulate login
    await Future.delayed(const Duration(seconds: 1));
    _isAuthenticated = true;
    _userEmail = email;
    _userName = email.split('@')[0];
    notifyListeners();
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _userName = null;
    _userEmail = null;
    notifyListeners();
  }

  Future<void> checkAuthStatus() async {
    // Check if user is already logged in
    await Future.delayed(const Duration(milliseconds: 500));
    // For now, auto-login for development
    _isAuthenticated = true;
    _userName = 'Demo User';
    _userEmail = 'demo@wastewise.com';
    notifyListeners();
  }
}
