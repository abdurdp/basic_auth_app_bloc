// theme_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum ThemeType { light, dark }

class ThemeState {
  final ThemeData themeData;
  ThemeState(this.themeData);
}

class ThemeBloc extends Bloc<ThemeType, ThemeState> {
  ThemeBloc() : super(ThemeState(ThemeData.light()));

  @override
  Stream<ThemeState> mapEventToState(ThemeType event) async* {
    yield ThemeState(
      event == ThemeType.light ? ThemeData.light() : ThemeData.dark(),
    );
  }
}
