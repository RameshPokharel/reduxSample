import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/action/user_action.dart';
import 'package:flutter_app/app_state/app_state.dart';
import 'package:flutter_app/model/login_response.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'error_dialog.dart';
import 'login_input_form.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title, this.viewModel}) : super(key: key);

  final String title;
  LoginViewModel viewModel;

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  loginUser(String username, String password) {
    widget.viewModel.login(username, password);
  }

  Widget getLoadingIndicator(LoginViewModel viewModel) {
    if (viewModel.isLoading) {
      return new CircularProgressIndicator();
    }

    return new Container();
  }

  showLoginError() {
    showDialog(
        context: context, builder: (BuildContext context) => ErrorDialog());
  }

  Widget buildContent(LoginViewModel viewModel) {
    widget.viewModel = viewModel;
    return new Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 150.0),
            child: Image.asset(
              "assets/images/logo.png", width: 300, height: 150,
            ),
          ),
          getLoadingIndicator(viewModel),
          LoginInputForm(onLoginValidationSuccess: loginUser),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
          child: new StoreConnector<AppState, LoginViewModel>(
            converter: (store) => LoginViewModel.fromStore(store),
            builder: (_, viewModel) => buildContent(viewModel),
            onDidChange: (viewModel) {
              if (viewModel.loginError) {
                showLoginError();
              }
            },
          )),
    );
  }
}
class LoginViewModel {
  final bool isLoading;
  final bool loginError;
  final LoginResponse user;

  final Function(String, String) login;

  LoginViewModel({
    this.isLoading,
    this.loginError,
    this.user,
    this.login,
  });

  static LoginViewModel fromStore(Store<AppState> store) {
    return LoginViewModel(
      isLoading: store.state.userState.isLoading,
      loginError: store.state.userState.loginError,
      user: store.state.userState.user,
      login: (String username, String password) {
        store.dispatch(LoginUser(name: username,pass: password));
      },
    );
  }
}