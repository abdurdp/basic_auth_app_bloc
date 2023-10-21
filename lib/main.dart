// main.dart
import 'package:basic_auth_app_bloc/screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'api_service.dart';
import 'bloc/language_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'localization.dart';
import 'main_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LanguageBloc()),
        BlocProvider(create: (context) => ThemeBloc()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (themeContext, themeState) {
          return BlocBuilder<LanguageBloc, LanguageState>(
            builder: (languageContext, languageState) {
              return MaterialApp(
                theme: themeState.themeData,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                ],
                supportedLocales: const [
                  Locale('en', 'US'),
                  Locale('bn', 'BD'),
                  Locale('ar', 'SA'),
                ],
                locale: languageState.locale,
                home: MyHomePage(),
              );
            },
          );
        },
      ),
    );
  }
}
// main_screen.dart

class MyHomePage extends StatelessWidget {
  final apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).appTitle),
          // Add a button/icon to open the drawer
          leading: Builder(
            builder: (context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
        ),
        drawer: MainDrawer(), // Add the custom drawer
        body:LoginScreen(apiService: apiService,)
    );
  }
}
