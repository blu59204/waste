import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/classification_provider.dart';
import '../providers/wallet_provider.dart';
import '../providers/stats_provider.dart';
import '../config/colors.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({Key? key}) : super(key: key);

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _isScanning = false;
  bool _hasResult = false;

  @override
  Widget build(BuildContext context) {
    final classificationProvider = Provider.of<ClassificationProvider>(context);
    
    return Scaffold(
      backgroundColor: AppColors.lightCream,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header
              const Text(
                'Scan Waste',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkBrown,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Point your camera at waste to classify it',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.darkBrown.withOpacity(0.6),
                ),
              ),
              const SizedBox(height: 30),
              
              // Camera Preview Area
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.primaryGreen.withOpacity(0.3),
                      width: 2,
                    ),
                  ),
                  child: _isScanning
                      ? _buildScanningView()
                      : _hasResult
                          ? _buildResultView(classificationProvider)
                          : _buildIdleView(),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Action Button
              _buildActionButton(classificationProvider),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdleView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.camera_alt_outlined,
          size: 80,
          color: AppColors.primaryGreen.withOpacity(0.5),
        ),
        const SizedBox(height: 20),
        Text(
          'Tap the button below to start scanning',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16,
            color: AppColors.darkBrown.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildScanningView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryGreen),
        ),
        const SizedBox(height: 20),
        Text(
          'Analyzing waste...',
          style: TextStyle(
            fontSize: 16,
            color: AppColors.darkBrown.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildResultView(ClassificationProvider provider) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              size: 60,
              color: AppColors.primaryGreen,
            ),
          ),
          const SizedBox(height: 30),
          
          const Text(
            'Classification Result',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.darkBrown,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          
          Text(
            provider.lastClassification ?? 'Unknown',
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: AppColors.darkBrown,
            ),
          ),
          
          const SizedBox(height: 10),
          
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.primaryGreen.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Confidence: ${(provider.confidence * 100).toStringAsFixed(1)}%',
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppColors.primaryGreen,
              ),
            ),
          ),
          
          const SizedBox(height: 30),
          
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.recycling,
                      color: AppColors.primaryGreen,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Recyclable',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBrown,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.check,
                      color: AppColors.primaryGreen,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Icon(
                      Icons.stars,
                      color: AppColors.accentGold,
                      size: 24,
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        'Points Earned',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkBrown,
                        ),
                      ),
                    ),
                    Text(
                      '+10',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.accentGold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(ClassificationProvider provider) {
    return ElevatedButton(
      onPressed: _isScanning ? null : _handleScan,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryGreen,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        elevation: 0,
      ),
      child: Text(
        _hasResult ? 'Scan Another' : 'Start Scanning',
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Future<void> _handleScan() async {
    setState(() {
      _isScanning = true;
      _hasResult = false;
    });

    // Simulate scanning
    final classificationProvider = Provider.of<ClassificationProvider>(
      context,
      listen: false,
    );
    await classificationProvider.classifyWaste('mock_image_path');

    // Add points and update stats
    final walletProvider = Provider.of<WalletProvider>(context, listen: false);
    walletProvider.addPoints(10);

    final statsProvider = Provider.of<StatsProvider>(context, listen: false);
    statsProvider.addScan(classificationProvider.lastClassification ?? 'Unknown');

    setState(() {
      _isScanning = false;
      _hasResult = true;
    });
  }
}
