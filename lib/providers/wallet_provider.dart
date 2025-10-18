import 'package:flutter/foundation.dart';

class Transaction {
  final String type;
  final int amount;
  final String description;
  final DateTime timestamp;

  Transaction({
    required this.type,
    required this.amount,
    required this.description,
    required this.timestamp,
  });
}

class WalletProvider with ChangeNotifier {
  int _balance = 1250;
  List<Transaction> _transactions = [
    Transaction(
      type: 'credit',
      amount: 10,
      description: 'from Scan',
      timestamp: DateTime.now().subtract(Duration(hours: 2)),
    ),
    Transaction(
      type: 'debit',
      amount: 50,
      description: 'Sent',
      timestamp: DateTime.now().subtract(Duration(days: 1)),
    ),
  ];

  int get balance => _balance;
  List<Transaction> get transactions => _transactions;

  void addTransaction(String type, int amount, String description) {
    _transactions.insert(
      0,
      Transaction(
        type: type,
        amount: amount,
        description: description,
        timestamp: DateTime.now(),
      ),
    );
    
    if (type == 'credit') {
      _balance += amount;
    } else {
      _balance -= amount;
    }
    
    notifyListeners();
  }

  Future<bool> sendWasteCoin(int amount) async {
    if (amount > _balance) return false;
    
    await Future.delayed(Duration(seconds: 1));
    addTransaction('debit', amount, 'Sent');
    return true;
  }

  Future<bool> requestAirdrop() async {
    await Future.delayed(Duration(seconds: 2));
    addTransaction('credit', 100, 'Airdrop (Devnet)');
    return true;
  }
}
