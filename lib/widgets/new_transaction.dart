import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  // const NewTransaction({super.key});
  final void Function(String, double) addTransactionHandler;


  NewTransaction({
    required this.addTransactionHandler,
    Key? key,
  }): super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);
    if(enteredTitle.isEmpty || enteredAmount <= 0) return;
    widget.addTransactionHandler(titleController.text, double.parse(amountController.text));
    Navigator.of(context).pop();
  }

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
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (_) => submitData(),
              // onChanged: (value) => titleInput = value,
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No date Chosen!'),
                  TextButton(
                    onPressed: null,
                    child:
                      Text('Choose Date',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                      ),)
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: submitData,
              child: Text('Add Transaction', style: TextStyle(color: Colors.white),))
          ]
        ),
      ),
    );
  }
}