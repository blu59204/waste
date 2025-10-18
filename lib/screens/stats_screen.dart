import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../providers/stats_provider.dart';
import '../widgets/clay_card.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({Key? key}) : super(key: key);

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
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {},
                    ),
                    Expanded(
                      child: Text(
                        'Achievements',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(24),
                  child: Consumer<StatsProvider>(
                    builder: (context, stats, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Achievement Badges
                          Text(
                            'Your Badges',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textDark,
                            ),
                          ),
                          SizedBox(height: 16),
                          
                          GridView.count(
                            crossAxisCount: 3,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            children: [
                              _buildBadge(
                                Icons.eco,
                                'First Scan',
                                true,
                                AppColors.accentGold,
                              ),
                              _buildBadge(
                                Icons.recycling,
                                '10 Scans',
                                true,
                                AppColors.accentGold,
                              ),
                              _buildBadge(
                                Icons.energy_savings_leaf,
                                '50 Scans',
                                false,
                                Colors.grey,
                              ),
                              _buildBadge(
                                Icons.local_florist,
                                'Eco Hero',
                                false,
                                Colors.grey,
                              ),
                              _buildBadge(
                                Icons.star,
                                'Streak 7',
                                false,
                                Colors.grey,
                              ),
                              _buildBadge(
                                Icons.emoji_events,
                                'Top 10',
                                false,
                                Colors.grey,
                              ),
                            ],
                          ),
                          SizedBox(height: 32),
                          
                          // Community Section
                          ClayCard(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Community',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                SizedBox(height: 16),
                                
                                // Character icons placeholder
                                Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: AppColors.cardCream,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: List.generate(3, (index) {
                                        return Padding(
                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                          child: Icon(
                                            Icons.person,
                                            size: 60,
                                            color: AppColors.clayBrown,
                                          ),
                                        );
                                      }),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          
                          // Leaderboard Preview
                          ClayCard(
                            padding: EdgeInsets.all(20),
                            color: AppColors.cardBeige,
                            child: Column(
                              children: [
                                // Trophy Display
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    _buildTrophy(Icons.emoji_events, AppColors.accentGold, 60),
                                    SizedBox(width: 16),
                                    _buildTrophy(Icons.emoji_events, AppColors.accentSilver, 50),
                                    SizedBox(width: 16),
                                    _buildTrophy(Icons.emoji_events, AppColors.accentBronze, 45),
                                  ],
                                ),
                                SizedBox(height: 16),
                                
                                Container(
                                  padding: EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.buttonGreen,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    'Leaderboard',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16),
                                
                                // Sample rankings
                                ...List.generate(5, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Container(
                                      padding: EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: AppColors.cardCream,
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 32,
                                            height: 32,
                                            decoration: BoxDecoration(
                                              color: AppColors.clayGreen,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.person,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Text(
                                              'User ${index + 1}',
                                              style: TextStyle(
                                                fontSize: 14,
                                                color: AppColors.textDark,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            '${index + 1}',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.textMedium,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadge(IconData icon, String label, bool unlocked, Color color) {
    return ClayCard(
      padding: EdgeInsets.all(12),
      color: unlocked ? AppColors.accentGold.withOpacity(0.2) : AppColors.cardBeige,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: 40,
            color: unlocked ? color : Colors.grey,
          ),
          SizedBox(height: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: unlocked ? AppColors.textDark : AppColors.textMedium,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildTrophy(IconData icon, Color color, double size) {
    return Icon(
      icon,
      size: size,
      color: color,
    );
  }
}
