// language_event.dart
abstract class LanguageEvent {}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;

  ChangeLanguage(this.languageCode);
}