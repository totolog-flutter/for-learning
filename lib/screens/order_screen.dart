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
  Future? _ordersFuture;
  Future _obtaineOrdersFuture() {
    return Provider.of<Orders>(context, listen: false).fetchAndSetOrders();
  }

  @override
  void initState() {
    _ordersFuture = _obtaineOrdersFuture();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('注文履歴'),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future: _ordersFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (snapshot.error != null) {
                return const Center(
                  child: Text('エラーが発生しました'),
                );
              } else {
                return Consumer<Orders>(
                  builder: (context, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (context, index) =>
                        OrderItem(orderData.orders[index]),
                  ),
                );
              }
            }
          },
        ));
  }
}
