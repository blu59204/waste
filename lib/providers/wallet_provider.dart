import 'package:flutter/foundation.dart';

class WalletProvider extends ChangeNotifier {
  double _balance = 100.0;
  List<Transaction> _transactions = [];

  double get balance => _balance;
  List<Transaction> get transactions => _transactions;

  void addPoints(int points) {
    _balance += points;
    _transactions.add(Transaction(
      amount: points.toDouble(),
      type: 'earn',
      description: 'Points earned from waste classification',
      timestamp: DateTime.now(),
    ));
    notifyListeners();
  }

  void redeemPoints(double amount, String description) {
    if (_balance >= amount) {
      _balance -= amount;
      _transactions.add(Transaction(
        amount: amount,
        type: 'redeem',
        description: description,
        timestamp: DateTime.now(),
      ));
      notifyListeners();
    }
  }

  Future<void> refreshBalance() async {
    await Future.delayed(const Duration(seconds: 1));
    notifyListeners();
  }
}

class Transaction {
  final double amount;
  final String type;
  final String description;
  final DateTime timestamp;

  Transaction({
    required this.amount,
    required this.type,
    required this.description,
    required this.timestamp,
  });
}
