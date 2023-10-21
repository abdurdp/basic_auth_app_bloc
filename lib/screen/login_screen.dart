// login_screen.dart
import 'package:basic_auth_app_bloc/screen/siginup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../api_service.dart';
import '../bloc/theme_bloc.dart';
import '../localization.dart';

class LoginScreen extends StatelessWidget {
  final ApiService apiService; // Inject your ApiService here
  LoginScreen({required this.apiService});

  Future<void> handleLogin() async {

    final phone = "1590000000";
    final password = "12345678";
    final macAddress = "886FE523-6BBC-4C8B-8981-01ECA8B48214";

    final loginSuccess = await apiService.login(phone, password, macAddress);

    if (loginSuccess['']) {
      // Handle successful login
    } else {
      // Handle login failure
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: Text(AppLocalizations.of(context).login), // Localized title
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (themeContext, themeState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(AppLocalizations.of(context).login), // Localized title
                // Username/Phone Input
                TextFormField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).phone, // Localized hint
                  ),
                ),
                // Password Input
                TextFormField(
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context).password, // Localized hint
                  ),
                  obscureText: true,
                ),
                // Login Button
                ElevatedButton(
                  onPressed: () {
                    // Add login logic using API service
                  },
                  child: Text(AppLocalizations.of(context).login), // Localized text
                ),
                SizedBox(height: 24,),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(AppLocalizations.of(context).signup),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
