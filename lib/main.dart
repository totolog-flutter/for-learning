import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List<PixabayImage> imageResults = [];

  Future<void> fetchImages(String text) async {
    final response =
        await Dio().get('https://pixabay.com/api', queryParameters: {
      'key': '30784791-edb103ec4f7535600962498e9',
      'q': text,
      'per_page': 100,
      'image_type': 'photo'
    });
    final List hits = response.data['hits'];
    setState(() {
      imageResults = hits.map((e) {
        return PixabayImage.fromMap(e);
      }).toList();
    });
  }

  Future<void> shareImage(String url) async {
    final Response response = await Dio()
        .get(url, options: Options(responseType: ResponseType.bytes));

    // 一時的に保存可能な領域のパスを取得
    final Directory dir = await getTemporaryDirectory();
    // responseに画像のデータがあるので、dirに書き込む処理
    final File file =
        await File(dir.path + '/image.png').writeAsBytes(response.data);

    Share.shareFiles([file.path]);
  }

  @override
  void initState() {
    // 最初に一度だけ呼ばれる。
    super.initState();
    fetchImages('花');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          initialValue: '花',
          decoration: InputDecoration(fillColor: Colors.white, filled: true),
          onFieldSubmitted: (text) {
            fetchImages(text);
          },
        ),
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3),
          itemCount: imageResults.length,
          itemBuilder: (context, index) {
            final imageResult = imageResults[index];
            return InkWell(
              onTap: () async {
                shareImage(imageResult.webformatURL);
              },
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    imageResult.previewURL,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.only(topLeft: Radius.circular(5))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 3, horizontal: 5),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.thumb_up_alt_outlined, size: 14),
                              const SizedBox(width: 7),
                              Text('${imageResult.likes}'),
                            ],
                          ),
                        )),
                  )
                ],
              ),
            );
          }),
    );
  }
}

// classで型を作る
class PixabayImage {
  // プロパティの生成
  final String webformatURL;
  final String previewURL;
  final int likes;

  // コンストラクターの生成
  PixabayImage(
      {required this.webformatURL,
      required this.previewURL,
      required this.likes});

  factory PixabayImage.fromMap(Map<String, dynamic> map) {
    return PixabayImage(
      webformatURL: map['webformatURL'],
      previewURL: map['previewURL'],
      likes: map['likes'],
    );
  }
}
