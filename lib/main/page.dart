import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_youtube1/main/vm.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  MainVm _vm = MainVm();

  @override
  void initState() {
    _vm.setRef(ref);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('住所取得'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              onChanged: (value) => _vm.onPostalCodeChanged(value),
            ),
            // Text('without family'),
            // Expanded(
            //   child: resAddress.when(
            //     data: (data) => ListView.separated(
            //       itemCount: data.data.length,
            //       separatorBuilder: (context, index) {
            //         return Divider(height: 0.5);
            //       },
            //       itemBuilder: (context, index) => ListTile(
            //         title: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Text(data.data[index].en.prefecture),
            //             Text(data.data[index].en.address1),
            //             Text(data.data[index].en.address2),
            //             Text(data.data[index].en.address3),
            //             Text(data.data[index].en.address4),
            //           ],
            //         ),
            //       ),
            //     ),
            //     error: (error, stackTrace) => Text(error.toString()),
            //     loading: () => const AspectRatio(
            //       aspectRatio: 1,
            //       child: CircularProgressIndicator(),
            //     ),
            //   ),
            // ),
            Expanded(
              child: _vm.postalCodeWithFamily(_vm.postalCode).when(
                data: (data) => ListView.separated(
                  itemCount: data.data.length,
                  separatorBuilder: (context, index) {
                    return Divider(height: 0.5);
                  },
                  itemBuilder: (context, index) => ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.data[index].en.prefecture),
                        Text(data.data[index].en.address1),
                        Text(data.data[index].en.address2),
                        Text(data.data[index].en.address3),
                        Text(data.data[index].en.address4),
                      ],
                    ),
                  ),
                ),
                error: (error, stackTrace) => Text(error.toString()),
                loading: () => const AspectRatio(
                  aspectRatio: 1,
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
