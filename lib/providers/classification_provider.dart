import 'package:flutter/foundation.dart';

class WasteItem {
  final String name;
  final double confidence;
  final String disposalInstructions;
  final String ecoTips;
  final int points;
  final bool recyclable;

  WasteItem({
    required this.name,
    required this.confidence,
    required this.disposalInstructions,
    required this.ecoTips,
    required this.points,
    required this.recyclable,
  });
}

class ClassificationProvider with ChangeNotifier {
  WasteItem? _lastClassification;
  bool _isClassifying = false;

  WasteItem? get lastClassification => _lastClassification;
  bool get isClassifying => _isClassifying;

  Future<WasteItem> classifyWaste() async {
    _isClassifying = true;
    notifyListeners();

    // Simulate ML classification
    await Future.delayed(Duration(seconds: 2));

    _lastClassification = WasteItem(
      name: 'Plastic Bottle',
      confidence: 0.98,
      disposalInstructions: 'Remove cap and rinse. Place in recycling bin.',
      ecoTips: 'Reduce plastic use. Consider reusable bottles.',
      points: 10,
      recyclable: true,
    );

    _isClassifying = false;
    notifyListeners();
    
    return _lastClassification!;
  }
}
