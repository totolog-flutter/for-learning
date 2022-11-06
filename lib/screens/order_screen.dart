import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_youtube1/providers/order.dart' show Orders;
import 'package:flutter_youtube1/widgets/order_item.dart';
import 'package:flutter_youtube1/widgets/app_drawer.dart';
// import '../providers/order.dart' show Orders;
// import '../widgets/order_item.dart';
// import '../widgets/app_drawer.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  static const routeName = '/orders';

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  var _isLoading = false;
  @override
  void initState() {
    Future.delayed(Duration.zero).then((_) async {
      setState(() {
        _isLoading = true;
      });
      await Provider.of<Orders>(context, listen: false);
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('注文履歴'),
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: orderData.orders.length,
              itemBuilder: ((context, index) => OrderItem(
                    orderData.orders[index],
                  )),
            ),
    );
  }
}
