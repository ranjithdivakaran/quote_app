import 'dart:convert';

import 'package:http/http.dart' as http;

Future api() async {
  var response = await http.get(Uri.parse("https://api.kanye.rest"));

  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);
    return data;
  }
}
