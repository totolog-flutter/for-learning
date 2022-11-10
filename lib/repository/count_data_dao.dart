import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_youtube1/data/count_data.dart';

class CountDataDao {
  final CollectionReference _collection =
      FirebaseFirestore.instance.collection('collection_count');

  void saveCountData(CountData countData) {
    _collection.add(countData.toJson());
  }

  Stream<QuerySnapshot> getSnapShot() {
    return _collection
        .orderBy('dateTime', descending: true)
        .limit(1)
        .snapshots();
  }
}
