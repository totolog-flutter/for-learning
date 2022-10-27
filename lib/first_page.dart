import 'package:flutter/material.dart';
// import 'second_page.dart';

class FirstPage extends StatelessWidget {
  String nameText = "";
  final List<String> entries = <String>['新しいホテルのかたち！2つの顔を持つソーシャライジングホテルが予約開始！', '泊まってみたい！おしゃれで個性的な東京のホテル＆ホステル15選', '軽井沢旅行におすすめの人気おしゃれホテル5選！軽井沢だからこそ味わえる上質な高級旅館'];
  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('toto-sanの動画一覧', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: Colors.black,
        actions: const [
          Icon(Icons.ondemand_video_outlined),
          SizedBox(width: 24),
          Icon(Icons.search),
          SizedBox(width: 24),
          Icon(Icons.menu),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 100,
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  Container(
                    width: deviceWidth * 0.4,
                    child: Image.network('https://cdn.clipkit.co/tenants/568/articles/images/000/002/657/large/e29bf188-1d15-4a24-9edf-87bf633d8370.jpg?1579069093',
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          entries[index],
                          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, height: 1.4),
                          maxLines: 3,
                        ),
                        Text(
                          '1053回視聴 5日前',
                          style: const TextStyle(color: Colors.white, fontSize: 12)
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        ),
      ),
    );
  }
}
