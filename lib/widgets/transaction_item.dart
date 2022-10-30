import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key? key,
    required this.transaction,
    required this.deleteTransaction,
  }) : super(key: key);

  final Transaction transaction;
  final void Function(String p1) deleteTransaction;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: FittedBox(
              child: Text('¥${transaction.amount}')
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          DateFormat('yyyy/MM/dd').format(transaction.date),
          style: TextStyle(
            color: Colors.grey
          ),
        ),
        trailing: MediaQuery.of(context).size.width > 460
          ? TextButton.icon(
            icon: Icon(Icons.delete, color: Colors.red,),
            label: Text('Delete', style: TextStyle(color: Colors.red),),
            onPressed: () => deleteTransaction(transaction.id)
          )
          : IconButton(icon: Icon(Icons.delete), color: Colors.red, onPressed: () => deleteTransaction(transaction.id),),
      ),
    );
  }
}