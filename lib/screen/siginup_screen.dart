import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../api_service.dart';
import '../bloc/theme_bloc.dart';
import '../localization.dart'; // Import your theme_bloc

class SignupScreen extends StatefulWidget {



  @override
  _SignupScreenState createState() => _SignupScreenState();
}
class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _countryCodeController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _divisionIdController = TextEditingController();
  TextEditingController _districtIdController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _macAddressController = TextEditingController();
  TextEditingController _profilePhotoController = TextEditingController();
  var _capturedImageBytes = null;
  var _capturedImageBase64 = null;
  final ApiService apiService = ApiService();
  final ThemeBloc themeBloc = ThemeBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).signup), // Localized title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Name Input
            TextFormField(
              controller: _nameController,
              key: Key('name'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).name, // Localized label
              ),
            ),

            // Email Input
            TextFormField(
              controller: _emailController,
              key: Key('email'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).email, // Localized label
              ),
            ),

            // Country Code Input
            TextFormField(
              controller: _countryCodeController,
              key: Key('countryCode'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).countryCode, // Localized label
              ),
            ),

            // Phone Input
            TextFormField(
              controller: _phoneController,
              key: Key('phone'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).phone, // Localized label
              ),
            ),

            // Gender Input
            TextFormField(
              controller: _genderController,
              key: Key('gender'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).gender, // Localized label
              ),
            ),

            // Date of Birth Input
            TextFormField(
              controller: _dobController,
              key: Key('dob'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).dob, // Localized label
              ),
            ),

            // Division ID Input
            TextFormField(
              controller: _divisionIdController,
              key: Key('divisionId'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).divisionId, // Localized label
              ),
            ),

            // District ID Input
            TextFormField(
              controller: _districtIdController,
              key: Key('districtId'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).districtId, // Localized label
              ),
            ),

            // Address Input
            TextFormField(
              controller: _addressController,
              key: Key('address'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).address, // Localized label
              ),
            ),

            // Password Input
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
controller: _passwordController,
              key: Key('password'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).password, // Localized label
              ),
            ),

            // Mac Address Input
            TextFormField(
              controller: _macAddressController,
              key: Key('macAddress'),
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).macAddress, // Localized label
              ),
            ),

            SizedBox(height: 24,),
            Container(
              child: _capturedImageBytes!=null? Image.memory(
                _capturedImageBytes ?? Uint8List(0),
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ):Container( width: 100,
                height: 100,),
            ),
            SizedBox(height: 24,),
            // Profile Photo Input
            ElevatedButton(
              onPressed: () async {
                await captureImageAndEncodeBase64();
              },
              child: Text('Capture Profile Photo'),
            ),
SizedBox(height: 24,),
            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Handle form submission and API request
                _submitForm();
              },
              child: Text(AppLocalizations.of(context).submit), // Localized button text
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle form submission and API request
  void _submitForm() {
    final name = _nameController.text;
    final email = _emailController.text;
    final countryCode = _countryCodeController.text;
    final phone = _phoneController.text;
    final gender = _genderController.text;
    final dob = _dobController.text;
    final divisionId = _divisionIdController.text;
    final districtId = _districtIdController.text;
    final address = _addressController.text;
    final password = _passwordController.text;
    final macAddress = _macAddressController.text;
    final profilePhoto = _profilePhotoController.text; // You can handle the file upload here if needed

    apiService.signup(
     name,
      email,
      countryCode,
      phone,
      gender,
      dob,
      divisionId,
      districtId,
      address,
      password,
      macAddress,
      _capturedImageBase64,
    );
  }
  Future<void> captureImageAndEncodeBase64() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();

      setState(() {
        _capturedImageBase64 = base64Encode(bytes);
        _capturedImageBytes = Uint8List.fromList(bytes);
      });
    } else {
      // Handle the case where the user didn't select or capture an image
    }
  }
}
