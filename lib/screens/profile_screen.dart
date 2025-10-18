import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../providers/auth_provider.dart';
import '../providers/stats_provider.dart';
import '../widgets/clay_card.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.backgroundGreen,
              AppColors.backgroundLight,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(24),
            child: Consumer2<AuthProvider, StatsProvider>(
              builder: (context, auth, stats, _) {
                return Column(
                  children: [
                    // Profile Header
                    ClayCard(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        children: [
                          // Avatar
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: AppColors.clayGreen.withOpacity(0.3),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.person,
                              size: 60,
                              color: AppColors.buttonGreen,
                            ),
                          ),
                          SizedBox(height: 16),
                          
                          // User Info
                          Text(
                            auth.userName,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            auth.userEmail,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColors.textMedium,
                            ),
                          ),
                          SizedBox(height: 16),
                          
                          // Stats Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              _buildStatItem('Scans', '${stats.totalScans}'),
                              _buildStatItem('Points', '${stats.ecoPoints}'),
                              _buildStatItem('CO₂', '${stats.carbonSaved}kg'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    // Settings
                    ClayCard(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Settings',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          SizedBox(height: 16),
                          
                          _buildSettingItem(Icons.person, 'Edit Profile', () {}),
                          _buildSettingItem(Icons.notifications, 'Notifications', () {}),
                          _buildSettingItem(Icons.language, 'Language', () {}),
                          _buildSettingItem(Icons.help, 'Help & Support', () {}),
                          _buildSettingItem(Icons.privacy_tip, 'Privacy Policy', () {}),
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    
                    // Logout Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          auth.logout();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.clayBrown,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Text(
                          'Logout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),
                    
                    // App Version
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.textMedium,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatItem(String label, String value) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.textDark,
          ),
        ),
        SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: AppColors.textMedium,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingItem(IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.buttonGreen,
              size: 24,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textDark,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: AppColors.textMedium,
            ),
          ],
        ),
      ),
    );
  }
}
