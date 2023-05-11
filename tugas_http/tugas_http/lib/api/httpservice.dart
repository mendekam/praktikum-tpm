import 'dart:convert';
import '../model/product.dart';
import 'package:http/http.dart' as http;

class HttpService {
  final String baseUrl = "https://fakestoreapi.com/products";

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((data) => Product.fromJson(data)).toList();
    } else {
      throw Exception('Error retrieving products.');
    }
  }
}
