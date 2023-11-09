import 'dart:convert';

import 'package:flight/model/flight_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<flightModel?> getData() async {
    var response = await http.post(
        Uri.parse('https://v1.nocodeapi.com/wynermedia/ep/SDqZnmRNgsJlgpxx'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "recordLocator": "D83PWG",
          "lastName": "ALAM",
        }));

    var data = jsonDecode(response.body);

    return flightModel.fromJson(data);
  }
}
