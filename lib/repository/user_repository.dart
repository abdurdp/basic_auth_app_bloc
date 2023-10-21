import 'package:dio/dio.dart';

import '../model/user_model.dart';

class UserRepository {

  Dio dio = Dio(); // Create a Dio instance.
  Future<User> login(String phone, String password, String macAddress) async {
    try {
      final response = await dio.post(
        'https://noexceptions.tech/api/user/login',
        data: {
          'phone': phone,
          'password': password,
          'mac_address': macAddress,
        },
      );

      if (response.statusCode == 200) {
        // Assuming your API response contains user data
        final userData = response.data as Map<String, dynamic>;
        return User.fromJson(userData);
      } else {
        throw Exception('Login failed: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Login failed: $error');
    }
  }
}
