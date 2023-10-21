// theme_bloc.dart
import 'package:basic_auth_app_bloc/theme/theme_event.dart';
import 'package:basic_auth_app_bloc/theme/theme_state.dart';
import 'package:bloc/bloc.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc() : super(LightTheme());

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ToggleTheme) {
      yield state is LightTheme ? DarkTheme() : LightTheme();
    }
  }
}