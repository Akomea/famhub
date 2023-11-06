import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService(this.baseUrl);

  Future<Map<String, dynamic>?> fetchMemberDetails(int memberId) async {
    try {
      final response = await http.get(Uri.parse('http://localhost:8000/members/$memberId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map<String, dynamic>) {
          return data;
        }
      }
    } catch (e) {
      print('Error fetching member details: $e');
    }

    return null; // Return null if the response is not as expected or an error occurs
  }


  Future<List<Map<String, dynamic>>> fetchAllMembers() async {
    final response = await http.get(Uri.parse('http://localhost:8000/members'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      // Assuming that the API returns a list of member details
      return data.cast<Map<String, dynamic>>(); // Cast the list elements to Map
    } else {
      throw Exception('Failed to load member details');
    }
  }

  Future<List<Map<String, dynamic>>?> fetchFamiliesOfMember(int memberId) async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/members/$memberId'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data is Map<String, dynamic> && data.containsKey('families')) {
          final List<dynamic> familiesData = data['families'];
          return familiesData.cast<Map<String, dynamic>>();
        }
      }
    } catch (e) {
      print('Error fetching member families: $e');
    }

    return null; // Return null if the response is not as expected or an error occurs
  }
}
