import 'package:flutter/foundation.dart';

class ClassificationProvider extends ChangeNotifier {
  String? _lastClassification;
  double _confidence = 0.0;
  int _totalScans = 0;

  String? get lastClassification => _lastClassification;
  double get confidence => _confidence;
  int get totalScans => _totalScans;

  Future<void> classifyWaste(String imagePath) async {
    // Simulate classification
    await Future.delayed(const Duration(seconds: 2));
    
    final classifications = [
      'Plastic',
      'Paper',
      'Glass',
      'Metal',
      'Organic',
      'E-Waste'
    ];
    
    _lastClassification = (classifications..shuffle()).first;
    _confidence = 0.85 + (0.15 * (DateTime.now().millisecond % 100) / 100);
    _totalScans++;
    
    notifyListeners();
  }

  void reset() {
    _lastClassification = null;
    _confidence = 0.0;
    notifyListeners();
  }
}
