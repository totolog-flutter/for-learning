import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  // const NewTransaction({super.key});
  final void Function(String, double) addTransactionHandler;

  final titleController = TextEditingController();
  final amountController = TextEditingController();
  NewTransaction({
    required this.addTransactionHandler,
    Key? key,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              // onChanged: (value) =>titleInput = value
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              // onChanged: (value) => titleInput = value,
            ),
            TextButton(
              onPressed: () {
                addTransactionHandler(titleController.text, double.parse(amountController.text));
                // print(amountInput);
              },
              child: Text('Add Transaction', style: TextStyle(color: Colors.purple),))
          ]
        ),
      ),
    );
  }
}