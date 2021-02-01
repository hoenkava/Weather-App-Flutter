import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);
  final String url;

  Future getData() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      String data = response.body;
      var decodedData = jsonDecode(data);
      return decodedData;
      // var temperature = decodedData['weather'][0]['description'];
      // var temp = decodedData['main']['temp'];
      // print(temp);
      // var name = decodedData['name'];
      // print(name);
      // print(temperature);
      // print(data);
    } else {
      print(response.statusCode);
    }
  }
}
