import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './model/transaction.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        // accentColor: Colors.yellow,
        // fontFamily: 'Quicksand',
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: 't1', title: 'ランニングシューズ', amount: 18000, date: DateTime.now()),
    // Transaction(id: 't2', title: '１週間分の野菜', amount: 9800, date: DateTime.now())
  ];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }
  final titleController = TextEditingController();
  final amountController = TextEditingController();



  void _addNewTransaction(
    String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: chosenDate
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(addTransactionHandler: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      }
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = (Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text(
              'Personal Expenses',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                ),
              ],
            ),
          )
        : AppBar(
          title: Text(
              'Personal Expenses',
            ),
          actions: [
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () => _startAddNewTransaction(context),
              ),
            ],
        )) as PreferredSizeWidget;
        
    final txListWidget = Container(
                  height: (mediaQuery.size.height - appBar.preferredSize.height - mediaQuery.padding.top) * 0.7,
                  child: TransactionList(transactions: _userTransactions, deleteTransaction: _deleteTransaction)
                );
    final pageBody = SafeArea(child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment:  CrossAxisAlignment.stretch,
          children: [
            if(isLandscape) Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Show Chart'),
                Switch.adaptive(
                  activeColor: Colors.purple,
                  value: _showChart,
                  onChanged: (value) {
                  setState(() {
                    _showChart = value;
                  });
                })
              ],
            ),
            if (!isLandscape) Container(
                  height: (
                    mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top
                  ) * 0.7,
                  child: Chart(_recentTransactions)
                ),
            if (!isLandscape) txListWidget,
            if(isLandscape)  _showChart
              ? Container(
                  height: (
                    mediaQuery.size.height -
                    appBar.preferredSize.height -
                    mediaQuery.padding.top
                  ) * 0.7,
                  child: Chart(_recentTransactions)
                )
              : txListWidget
          ],
        ),
      ));

    return Platform.isIOS
      ? CupertinoPageScaffold(
          child: pageBody,
          navigationBar: appBar as ObstructingPreferredSizeWidget,
        )
      : Scaffold(
          appBar: appBar,
          body: pageBody,
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Platform.isIOS
            ? Container()
            : FloatingActionButton(
              child:Icon(Icons.add),
              onPressed: () => _startAddNewTransaction(context),
            ),
      );
  }
}