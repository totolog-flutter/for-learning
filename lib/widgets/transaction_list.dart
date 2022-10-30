import 'package:flutter/material.dart';
import '../model/transaction.dart';

import './transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final void Function(String) deleteTransaction;

  const TransactionList({required this.transactions, required this.deleteTransaction});
  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
      ? LayoutBuilder(builder: (ctx, constrains) {
          return Column(children: [
              Text('No Transaction'),
              SizedBox(height: 20,),
              Container(
                height: constrains.maxHeight * 0.6,
                child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,))
            ],
          );
        },
      )
      : ListView.builder(
      itemBuilder:(ctx, index) {
        return TransactionItem(transaction: transactions[index], deleteTransaction: deleteTransaction);
      },
      itemCount: transactions.length,
    );
  }
}