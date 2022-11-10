import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_youtube1/data/postal_code.dart';

class AddressLogic {
  Future<PostalCode> getPostalCode(String postalCode) async {
    if (postalCode.length != 7) throw Exception('郵便番号は7文字で！');
    final upper = postalCode.substring(0, 3);
    final lower = postalCode.substring(3);

    final apiUrl =
        'https://madefor.github.io/postal-code-api/api/v1/${upper}/${lower}.json';
    final apiUri = Uri.parse(apiUrl);
    final response = await http.get(apiUri);

    if (response.statusCode != 200)
      throw Exception('No Postal Code: ${postalCode}');

    var jsonData = jsonDecode(response.body);
    return PostalCode.fromJson(jsonData);
  }

  bool canProceed(String postalCode) {
    return postalCode.length == 7;
  }
}
