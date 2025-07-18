import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/app_model.dart';

class ApiService {
  static const String _baseUrl = 'https://itunes.apple.com/search';

  Future<List<AppModel>> fetchNeonApps() async {
    try {
      final response = await http.get(
        Uri.parse('$_baseUrl?term=neonapps&entity=software')
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];
        
        return results.map((item) => AppModel.fromJson(item)).toList();
      } else {
        throw Exception('API request failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching apps: $e');
    }
  }
}