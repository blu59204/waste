import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';
import '../providers/stats_provider.dart';
import '../config/colors.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final statsProvider = Provider.of<StatsProvider>(context);
    
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile Header
              const Text(
                'Profile',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBrown,
                ),
              ),
              const SizedBox(height: 30),
              
              // Avatar
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.primaryGreen, AppColors.primaryGreen.withOpacity(0.7)],
                  ),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              
              const SizedBox(height: 20),
              
              Text(
                authProvider.userName ?? 'User',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBrown,
                ),
              ),
              
              const SizedBox(height: 5),
              
              Text(
                authProvider.userEmail ?? 'user@example.com',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.darkBrown.withOpacity(0.6),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Achievement Badges
              _buildAchievementsSection(statsProvider),
              
              const SizedBox(height: 30),
              
              // Settings Options
              _buildSettingsSection(context, authProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAchievementsSection(StatsProvider statsProvider) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Achievements',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBrown,
            ),
          ),
          const SizedBox(height: 20),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildAchievementBadge(
                Icons.stars,
                'Beginner',
                statsProvider.totalScans >= 10,
              ),
              _buildAchievementBadge(
                Icons.eco,
                'Eco Warrior',
                statsProvider.carbonSaved >= 50,
              ),
              _buildAchievementBadge(
                Icons.trending_up,
                'Consistent',
                statsProvider.totalScans >= 50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAchievementBadge(IconData icon, String label, bool unlocked) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: unlocked
                ? AppColors.accentGold.withOpacity(0.2)
                : Colors.grey.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: unlocked ? AppColors.accentGold : Colors.grey,
            size: 30,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: unlocked ? AppColors.darkBrown : Colors.grey,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildSettingsSection(BuildContext context, AuthProvider authProvider) {
    return Column(
      children: [
        _buildSettingsItem(
          'Edit Profile',
          Icons.edit,
          () {},
        ),
        _buildSettingsItem(
          'Notifications',
          Icons.notifications,
          () {},
        ),
        _buildSettingsItem(
          'Privacy',
          Icons.privacy_tip,
          () {},
        ),
        _buildSettingsItem(
          'Help & Support',
          Icons.help,
          () {},
        ),
        _buildSettingsItem(
          'About',
          Icons.info,
          () {},
        ),
        const SizedBox(height: 10),
        _buildSettingsItem(
          'Logout',
          Icons.logout,
          () {
            authProvider.logout();
          },
          isDestructive: true,
        ),
      ],
    );
  }

  Widget _buildSettingsItem(
    String title,
    IconData icon,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: isDestructive
                        ? Colors.red.withOpacity(0.1)
                        : AppColors.primaryGreen.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: isDestructive ? Colors.red : AppColors.primaryGreen,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: isDestructive ? Colors.red : AppColors.darkBrown,
                    ),
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.darkBrown.withOpacity(0.3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
