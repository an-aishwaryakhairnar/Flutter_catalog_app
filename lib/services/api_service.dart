import 'package:http/http.dart' as http;

class ApiService {
  Future<http.Response> fetchProducts(String url) {
    return http.get(Uri.parse(url));
  }
}
