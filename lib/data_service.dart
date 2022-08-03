import 'package:http/http.dart' as http;

class DataService{
  Future<String> makeRequestToApi() async {
    //https://demo-v3-laravelapi.gzeinnumer.com/api/products/all
    final uri = Uri.https("demo-v3-laravelapi.gzeinnumer.com", "/api/products/all");
    final response = await http.get(uri);
    return response.body;
  }
}