// login_bloc.dart
import 'package:bloc/bloc.dart';

import '../repository/user_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;

  LoginBloc(this.userRepository) : super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();
      try {
        final user = await userRepository.login(event.phone, event.password,event.macAddress);
        yield LoginSuccess(user);
      } catch (error) {
        yield LoginFailure(error.toString());
      }
    }
  }
}