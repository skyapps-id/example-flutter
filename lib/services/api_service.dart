import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/catalog.dart';

class ApiService {
  static const String url = 'https://jsonplaceholder.typicode.com/posts';

  static Future<List<Catalog>> fetchCatalogs() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> body = json.decode(response.body);
      List<Catalog> catalogs =
          body.map((dynamic item) => Catalog.fromJson(item)).toList();
      return catalogs;
    } else {
      throw Exception('Failed to load catalogs');
    }
  }
}
