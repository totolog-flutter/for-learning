import 'dart:convert';
import 'package:flutter_youtube1/src/features/sample/data/register_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  // const SharedPreference({Key? key}) : super();

  Future<List<String>> getJsonRecords() async {
    final prefs = await SharedPreferences.getInstance();
    final recordsString = prefs.getStringList('records') ?? [];
    return recordsString;
  }

  Future<List<Register>> getRecord() async {
    final jsonRecords = await getJsonRecords();
    final records = jsonRecords.map((e) => jsonDecode(e) as Register);
    return records.toList();
  }

  Future<void> saveRecord(
      String menu, String content, DateTime dateTime) async {
    dateTime.toString();
    final prefs = await SharedPreferences.getInstance();
    final currentRecords = await getJsonRecords();
    currentRecords.add(jsonEncode({
      'menu': menu,
      'content': content,
      'dateTime': dateTime.toString(),
    }));

    print(currentRecords);
    prefs.setStringList('records', currentRecords);
  }

  Future<void> resetRecords() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('records');
  }
}
