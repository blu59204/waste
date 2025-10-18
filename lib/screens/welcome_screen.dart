import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../providers/auth_provider.dart';
import '../widgets/clay_card.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.clayGreen.withOpacity(0.3),
              AppColors.backgroundLight,
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo and Title
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: AppColors.clayGreen.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.eco,
                    size: 80,
                    color: AppColors.buttonGreen,
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  'Waste Wise',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                    letterSpacing: 1.2,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  'Transform waste into rewards',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textMedium,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                
                // 3D Character Placeholder
                Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: AppColors.cardBeige,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.person,
                      size: 120,
                      color: AppColors.clayBrown,
                    ),
                  ),
                ),
                SizedBox(height: 60),
                
                // Login Buttons
                ClayButton(
                  text: 'Login with Google',
                  icon: Icons.g_mobiledata,
                  color: AppColors.buttonGreen,
                  onPressed: () async {
                    final authProvider = Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    );
                    await authProvider.loginWithGoogle();
                  },
                ),
                SizedBox(height: 16),
                ClayButton(
                  text: 'Email',
                  icon: Icons.email,
                  color: AppColors.cardBeige,
                  textColor: AppColors.textDark,
                  onPressed: () async {
                    final authProvider = Provider.of<AuthProvider>(
                      context,
                      listen: false,
                    );
                    await authProvider.loginWithEmail('demo@wastewise.com');
                  },
                ),
                SizedBox(height: 24),
                TextButton(
                  onPressed: () {
                    // Skip login for now
                    Provider.of<AuthProvider>(context, listen: false)
                        .loginWithEmail('guest@wastewise.com');
                  },
                  child: Text(
                    'Continue as Guest',
                    style: TextStyle(
                      color: AppColors.textMedium,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
