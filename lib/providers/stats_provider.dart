import 'package:flutter/foundation.dart';

class StatsProvider with ChangeNotifier {
  int _ecoPoints = 1450;
  double _carbonSaved = 12.5;
  int _totalScans = 24;
  Map<String, int> _wasteTypeScans = {
    'Plastic': 8,
    'Paper': 6,
    'Glass': 4,
    'Metal': 3,
    'Organic': 3,
  };

  int get ecoPoints => _ecoPoints;
  double get carbonSaved => _carbonSaved;
  int get totalScans => _totalScans;
  Map<String, int> get wasteTypeScans => _wasteTypeScans;

  void addScan(String wasteType, int points, double carbon) {
    _totalScans++;
    _ecoPoints += points;
    _carbonSaved += carbon;
    
    if (_wasteTypeScans.containsKey(wasteType)) {
      _wasteTypeScans[wasteType] = _wasteTypeScans[wasteType]! + 1;
    } else {
      _wasteTypeScans[wasteType] = 1;
    }
    
    notifyListeners();
  }

  void resetStats() {
    _ecoPoints = 0;
    _carbonSaved = 0.0;
    _totalScans = 0;
    _wasteTypeScans.clear();
    notifyListeners();
  }
}
