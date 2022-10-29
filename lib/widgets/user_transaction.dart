import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../model/transaction.dart';

class UserTransaction extends StatefulWidget {
  // const UserTransaction({super.key});

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(id: 't1', title: 'ランニングシューズ', amount: 18000, date: DateTime.now()),
    Transaction(id: 't2', title: '１週間分の野菜', amount: 9800, date: DateTime.now())
  ];

  void _addNewTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(addTransactionHandler: _addNewTransaction),
        TransactionList(transactions: _userTransactions),
      ]
    );
  }
}