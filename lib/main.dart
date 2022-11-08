import 'package:flutter/material.dart';

void main() {
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
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = TransformationController();
  double scaleRation = 1.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.addListener(() {
      setState(() {
        scaleRation = controller.value.getMaxScaleOnAxis();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('鳥瞰図'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            InteractiveViewer(
              minScale: 1.0,
              scaleEnabled: true,
              panEnabled: true,
              transformationController: controller,
              child: IntrinsicHeight(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      'assets/images/kipchoge.jpeg',
                      fit: BoxFit.cover,
                    ),
                    Text(
                      '拡大率: ${scaleRation}',
                      style: TextStyle(color: Colors.white),
                    ),
                    Align(
                      alignment: const Alignment(-0.1, -0.45),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              print('nike wear');
                            },
                            icon: Icon(
                              Icons.location_on,
                              color: Colors.red,
                              size: 40,
                            ),
                          )
                        ],
                      ),
                    ),
                    Visibility(
                      visible: scaleRation > 1.5,
                      child: Align(
                        alignment: const Alignment(0.04, -0.15),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {
                                print('nike wear');
                              },
                              icon: Icon(
                                Icons.location_on,
                                color: Colors.blue,
                                size: 40,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
