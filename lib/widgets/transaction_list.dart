import 'package:flutter/material.dart';
import '../model/transaction.dart';

import 'package:intl/intl.dart';

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
        return Card(
          elevation: 5,
          margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: FittedBox(
                  child: Text('¥${transactions[index].amount}')
                ),
              ),
            ),
            title: Text(
              transactions[index].title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              DateFormat('yyyy/MM/dd').format(transactions[index].date),
              style: TextStyle(
                color: Colors.grey
              ),
            ),
            trailing: MediaQuery.of(context).size.width > 360
              ? TextButton.icon(
                icon: Icon(Icons.delete, color: Colors.red,),
                label: Text('Delete', style: TextStyle(color: Colors.red),),
                onPressed: () => deleteTransaction(transactions[index].id)
              )
              : IconButton(icon: Icon(Icons.delete), color: Colors.red, onPressed: () => deleteTransaction(transactions[index].id),),
          ),
        );
      },
      itemCount: transactions.length,
    );
  }
}