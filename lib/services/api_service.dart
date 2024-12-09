import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sleek_property_management_system/services/api_endpoint.dart';

class ApiService {

  Future<List<dynamic>> fetchProperties() async {
    final response = await http.get(Uri.parse(ApiEndPoint.properties));
    print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
    print(response.body);
    print("YYYYYYYYYYYYYYYYYYYYYYYYYYYYYY");
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Failed to load properties');
  }

  Future<void> addProperty(Map<String, dynamic> property) async {
    final response = await http.post(
      Uri.parse(ApiEndPoint.properties),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(property),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to add property');
    }
  }

  Future<void> deleteProperty(int id) async {

    final response = await http.delete(Uri.parse(ApiEndPoint.delete+id.toString()));
    if (response.statusCode != 200) {
      throw Exception('Failed to delete property');
    }
  }

  Future<void> updateProperty(int id, Map<String, dynamic> property) async {
    final response = await http.put(
      Uri.parse(ApiEndPoint.update+id.toString()),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(property),
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to update property');
    }
  }
}
