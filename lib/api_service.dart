// api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://noexceptions.tech/api/user';

  Future<Map<String, dynamic>> login(String phone, String password, String macAddress) async {
    final response = await http.post(
      '$baseUrl/login' as Uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phone': phone, 'password': password, 'mac_address': macAddress}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }


  Future<Map<String, dynamic>?> signup(
     String name,
     String email,
     String countryCode,
     String phone,
     String gender,
     String dob,
      String divisionId,
      String districtId,
     String address,
     String password,
     String macAddress,
     String profilePhoto, // You may need to convert this to base64
  ) async {
    final url = '$baseUrl/signup';

    final Map<String, dynamic> data = {
      'name': name,
      'email': email,
      'country_code': countryCode,
      'phone': phone,
      'gender': gender,
      'dob': dob,
      'division_id': int.parse(divisionId),
      'district_id': int.parse(districtId),
      'address': address,
      'password': password,
      'mac_address': macAddress,
      'profile_photo': profilePhoto,
    };

    final headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: json.encode(data),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> responseBody = json.decode(response.body);
      return responseBody;
    } else {
      return null;
    }
  }
}
