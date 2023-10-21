// main_drawer.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/language_bloc.dart';
import 'bloc/theme_bloc.dart';
import 'localization.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return BlocBuilder<LanguageBloc, LanguageState>(
          builder: (languageContext, languageState) {
            return Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(height: 24,),
                  ListTile(
                    title: Text(AppLocalizations.of(context).translate("appTitle")),
                    onTap: () {
                      BlocProvider.of<ThemeBloc>(themeContext)
                          .add(ThemeType.light);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).themeDark),
                    onTap: () {
                      BlocProvider.of<ThemeBloc>(themeContext)
                          .add(ThemeType.dark);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).themeLight),
                    onTap: () {
                      BlocProvider.of<ThemeBloc>(themeContext)
                          .add(ThemeType.light);
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).languageEnglish),
                    onTap: () {
                      BlocProvider.of<LanguageBloc>(languageContext)
                          .add(Locale('en', 'US'));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).languageBangla),
                    onTap: () {
                      BlocProvider.of<LanguageBloc>(languageContext)
                          .add(Locale('bn', 'BD'));
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: Text(AppLocalizations.of(context).languageArabic),
                    onTap: () {
                      BlocProvider.of<LanguageBloc>(languageContext)
                          .add(Locale('ar', 'SA'));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
