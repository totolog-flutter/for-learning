import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_youtube1/providers/order.dart' show Orders;
import 'package:flutter_youtube1/widgets/order_item.dart';
import 'package:flutter_youtube1/widgets/app_drawer.dart';
// import '../providers/order.dart' show Orders;
// import '../widgets/order_item.dart';
// import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  static const routeName = '/orders';

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('注文履歴'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
        itemCount: orderData.orders.length,
        itemBuilder: ((context, index) => OrderItem(
              orderData.orders[index],
            )),
      ),
    );
  }
}
