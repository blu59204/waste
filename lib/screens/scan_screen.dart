import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/colors.dart';
import '../providers/classification_provider.dart';
import '../providers/stats_provider.dart';
import '../providers/wallet_provider.dart';
import '../widgets/clay_card.dart';
import 'scan_result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _isScanning = false;

  Future<void> _startScan() async {
    setState(() {
      _isScanning = true;
    });

    final classificationProvider = Provider.of<ClassificationProvider>(
      context,
      listen: false,
    );

    final result = await classificationProvider.classifyWaste();

    if (mounted) {
      setState(() {
        _isScanning = false;
      });

      // Update stats and wallet
      final statsProvider = Provider.of<StatsProvider>(context, listen: false);
      final walletProvider = Provider.of<WalletProvider>(context, listen: false);
      
      statsProvider.addScan(result.name, result.points, 0.5);
      walletProvider.addTransaction('credit', result.points, 'from Scan');

      // Navigate to result screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScanResultScreen(wasteItem: result),
        ),
      );
    }
  }

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
                      onPressed: () => Navigator.pop(context),
                    ),
                    Expanded(
                      child: Text(
                        'Scan Waste',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.textDark,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(width: 48), // Balance back button
                  ],
                ),
              ),
              
              Expanded(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Camera Preview Placeholder
                        ClayCard(
                          padding: EdgeInsets.all(0),
                          borderRadius: 24,
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            decoration: BoxDecoration(
                              color: AppColors.clayGreen.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  _isScanning ? Icons.hourglass_empty : Icons.camera_alt,
                                  size: 80,
                                  color: AppColors.buttonGreen,
                                ),
                                SizedBox(height: 16),
                                Text(
                                  _isScanning
                                      ? 'Analyzing...'
                                      : 'Position item in frame',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: AppColors.textMedium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 32),
                        
                        // Scan Button
                        if (!_isScanning)
                          GestureDetector(
                            onTap: _startScan,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: AppColors.buttonGreen,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.buttonGreen.withOpacity(0.4),
                                    blurRadius: 20,
                                    offset: Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.camera,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          )
                        else
                          CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.buttonGreen,
                            ),
                          ),
                        
                        SizedBox(height: 24),
                        Text(
                          _isScanning
                              ? 'Identifying waste type...'
                              : 'Tap to scan',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ],
                    ),
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
