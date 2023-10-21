
// language_bloc.dart
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';

import 'language_event.dart';
import 'language_state.dart';

// language_bloc.dart
import 'package:bloc/bloc.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(LanguageLoaded('en')); // Default language is English

  @override
  Stream<LanguageState> mapEventToState(LanguageEvent event) async* {
    if (event is ChangeLanguage) {
      yield LanguageLoaded(event.languageCode);
    }
  }
}