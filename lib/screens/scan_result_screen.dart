import 'package:flutter/material.dart';
import '../config/colors.dart';
import '../providers/classification_provider.dart';
import '../widgets/clay_card.dart';

class ScanResultScreen extends StatelessWidget {
  final WasteItem wasteItem;

  const ScanResultScreen({
    Key? key,
    required this.wasteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.clayBrown.withOpacity(0.3),
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
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Scan Result',
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
                  child: Column(
                    children: [
                      // Item Display Card
                      ClayCard(
                        padding: EdgeInsets.all(24),
                        color: AppColors.cardCream,
                        child: Column(
                          children: [
                            Text(
                              wasteItem.name,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppColors.textDark,
                              ),
                            ),
                            SizedBox(height: 16),
                            
                            // Item Image Placeholder
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                color: AppColors.backgroundLight,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Icon(
                                Icons.recycling,
                                size: 100,
                                color: AppColors.buttonGreen,
                              ),
                            ),
                            SizedBox(height: 16),
                            
                            // Confidence
                            Text(
                              '${(wasteItem.confidence * 100).toInt()}% Confidence',
                              style: TextStyle(
                                fontSize: 16,
                                color: AppColors.textMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      
                      // Info Cards Row
                      Row(
                        children: [
                          Expanded(
                            child: ClayCard(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    'Disposal Instructions',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 12),
                                  Icon(
                                    Icons.delete_outline,
                                    size: 48,
                                    color: AppColors.clayBrown,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: ClayCard(
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Text(
                                    'Eco-Tips',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.textDark,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 12),
                                  Icon(
                                    Icons.eco,
                                    size: 32,
                                    color: AppColors.buttonGreen,
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '+${wasteItem.points}',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.buttonGreen,
                                    ),
                                  ),
                                  Text(
                                    'Eco Points',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textMedium,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 24),
                      
                      // Details Card
                      ClayCard(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.info_outline,
                                  color: AppColors.buttonGreen,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Disposal Instructions',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              wasteItem.disposalInstructions,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textMedium,
                                height: 1.5,
                              ),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Icon(
                                  Icons.lightbulb_outline,
                                  color: AppColors.accentGold,
                                  size: 24,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'Eco Tips',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.textDark,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Text(
                              wasteItem.ecoTips,
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.textMedium,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      
                      // Action Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => Navigator.pop(context),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonGreen,
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
}
