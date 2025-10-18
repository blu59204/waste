import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../providers/stats_provider.dart';
import '../providers/auth_provider.dart';
import '../widgets/clay_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.eco,
                      color: AppColors.buttonGreen,
                      size: 28,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Waste Wise',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textDark,
                      ),
                    ),
                    Spacer(),
                    ClayIconButton(
                      icon: Icons.person,
                      size: 40,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Column(
                    children: [
                      // 3D Character
                      Container(
                        width: 180,
                        height: 180,
                        decoration: BoxDecoration(
                          color: AppColors.clayGreen.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(90),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: AppColors.buttonGreen,
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      
                      // Stats Cards
                      Consumer<StatsProvider>(
                        builder: (context, stats, _) {
                          return Row(
                            children: [
                              Expanded(
                                child: _buildStatCard(
                                  context,
                                  'Eco Points',
                                  '${stats.ecoPoints} pts',
                                  Icons.eco,
                                  AppColors.clayBrown,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: _buildStatCard(
                                  context,
                                  'Carbon Saved',
                                  '${stats.carbonSaved} kg',
                                  Icons.energy_savings_leaf,
                                  AppColors.cardCream,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: 24),
                      
                      // Quick Actions
                      ClayCard(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Quick Actions',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildActionButton(
                                  context,
                                  Icons.qr_code_scanner,
                                  'Scan',
                                  () {},
                                ),
                                _buildActionButton(
                                  context,
                                  Icons.history,
                                  'History',
                                  () {},
                                ),
                                _buildActionButton(
                                  context,
                                  Icons.lightbulb_outline,
                                  'Tips',
                                  () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      
                      // Recent Activity
                      Consumer<StatsProvider>(
                        builder: (context, stats, _) {
                          return ClayCard(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Waste Types Scanned',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                SizedBox(height: 16),
                                ...stats.wasteTypeScans.entries.map((entry) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 12),
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: AppColors.clayGreen.withOpacity(0.3),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Icon(
                                            Icons.recycling,
                                            color: AppColors.buttonGreen,
                                            size: 24,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            entry.key,
                                            style: TextStyle(
                                              fontSize: 16,
                                              color: AppColors.textDark,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '${entry.value}',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.buttonGreen,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return ClayCard(
      color: color,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: AppColors.textMedium,
            ),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
              ),
              Icon(
                icon,
                color: AppColors.buttonGreen,
                size: 32,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context,
    IconData icon,
    String label,
    VoidCallback onPressed,
  ) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: AppColors.buttonGreen.withOpacity(0.2),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(
                icon,
                color: AppColors.buttonGreen,
                size: 28,
              ),
            ),
            SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.textMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
