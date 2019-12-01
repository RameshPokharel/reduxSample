import 'package:flutter_app/model/login_response.dart';

class UserAction {}

class StartLoadingAction {
  StartLoadingAction();
}

class LoginSuccessAction {
  final LoginResponse user;

  LoginSuccessAction(this.user);
}

class LoginFailedAction {
  LoginFailedAction();
}

 class LoginUser {
  final String name;
  final String pass;

  LoginUser({this.name, this.pass});
}
