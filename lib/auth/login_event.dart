// login_event.dart
abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String phone;
  final String password;
  final String macAddress;

  LoginButtonPressed({required this.phone, required this.password,required this.macAddress});

}

class LoginPhoneChanged extends LoginEvent {
  final String phone;

  LoginPhoneChanged(this.phone);
}

class LoginPasswordChanged extends LoginEvent {
  final String password;

  LoginPasswordChanged(this.password);
}
