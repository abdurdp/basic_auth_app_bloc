
// language_state.dart
abstract class LanguageState {}

class LanguageLoaded extends LanguageState {
  final String languageCode;

  LanguageLoaded(this.languageCode);
}
