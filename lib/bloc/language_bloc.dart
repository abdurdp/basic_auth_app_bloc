// language_bloc.dart
import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageState {
  final Locale locale;
  LanguageState(this.locale);
}

class LanguageBloc extends Bloc<Locale, LanguageState> {
  LanguageBloc() : super(LanguageState(Locale('en')));

  @override
  Stream<LanguageState> mapEventToState(Locale event) async* {
    yield LanguageState(event);
  }
}
