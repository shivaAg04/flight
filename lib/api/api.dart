import 'dart:convert';

import 'package:flight/model/flight_model.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<flightModel?> getData() async {
    try {
      var response = await http.post(
          Uri.parse('https://v1.nocodeapi.com/wynermedia/ep/SDqZnmRNgsJlgpxx'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "recordLocator": "D83PWG",
            "lastName": "ALAM",
          }));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        print(data);

        // Ensure your FlightModel class has a proper fromJson constructor
        return flightModel.fromJson(data);
      } else {
        // Handle the case when the response status code is not 200
        print(response.body);
        print("Request failed with status: ${response.statusCode}");
      }
    } catch (e) {
      // Handle any exceptions that may occur during the HTTP request
      print("Error during HTTP request: $e");
    }

    return null;
  }
}
