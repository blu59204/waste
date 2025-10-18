import 'package:flutter/foundation.dart';

class StatsProvider extends ChangeNotifier {
  int _totalScans = 0;
  double _carbonSaved = 0.0;
  Map<String, int> _wasteBreakdown = {
    'Plastic': 15,
    'Paper': 10,
    'Glass': 5,
    'Metal': 8,
    'Organic': 20,
    'E-Waste': 3,
  };

  int get totalScans => _totalScans;
  double get carbonSaved => _carbonSaved;
  Map<String, int> get wasteBreakdown => _wasteBreakdown;

  void addScan(String wasteType) {
    _totalScans++;
    _wasteBreakdown[wasteType] = (_wasteBreakdown[wasteType] ?? 0) + 1;
    _carbonSaved += 0.5; // 0.5 kg CO2 saved per scan
    notifyListeners();
  }

  Future<void> refreshStats() async {
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }
}
