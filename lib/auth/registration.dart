import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

class RegistrationEvent {}

class RegistrationState {}

class RegistrationInitial extends RegistrationState {}

class RegistrationLoading extends RegistrationState {}

class RegistrationSuccess extends RegistrationState {}

class RegistrationFailure extends RegistrationState {
  final String error;

  RegistrationFailure(this.error);
}

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  final Dio dio = Dio();
  final String signUpUrl = 'https://noexceptions.tech/api/user/signup';

  RegistrationBloc() : super(RegistrationInitial());

  @override
  Stream<RegistrationState> mapEventToState(RegistrationEvent event) async* {
    if (event is RegistrationSubmitted) {
      yield RegistrationLoading();

      try {
        final response = await dio.post(
          signUpUrl,
          data: event.registrationData,
        );

        if (response.statusCode == 200) {
          yield RegistrationSuccess();
        } else {
          yield RegistrationFailure('Registration failed: ${response.statusCode}');
        }
      } catch (error) {
        yield RegistrationFailure('Registration failed: $error');
      }
    }
  }
}

class RegistrationSubmitted extends RegistrationEvent {
  final Map<String, dynamic> registrationData;

  RegistrationSubmitted(this.registrationData);
}
