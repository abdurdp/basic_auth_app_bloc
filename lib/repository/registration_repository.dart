import 'package:dio/dio.dart';

class RegistrationRepository {
  final Dio dio = Dio();

  Future<void> signUp(
      String name,
      String email,
      String phone,
      String gender,
      String dob,
      int divisionId,
      int districtId,
      String address,
      String password,
      ) async {
    try {
      final response = await dio.post(
        'https://noexceptions.tech/api/user/signup',
        data: {
          'name': name,
          'email': email,
          'phone': phone,
          'gender': gender,
          'dob': dob,
          'division_id': divisionId,
          'district_id': districtId,
          'address': address,
          'password': password,
          'mac_address': '00-B0-D0-63-C2-26', // You can obtain the MAC address here
          'profile_photo': '', // Add base64 encoded image if needed
        },
      );

      if (response.statusCode == 200) {
        // Signup was successful
      } else {
        throw Exception('Sign Up failed: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Sign Up failed: $error');
    }
  }
}
