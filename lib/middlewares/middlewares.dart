import 'package:flutter_app/action/user_action.dart';
import 'package:flutter_app/app_state/app_state.dart';
import 'package:flutter_app/model/login_response.dart';
import 'package:flutter_app/navigation/navigation.dart';
import 'package:redux/redux.dart';

void middleWares(Store<AppState> store, action, NextDispatcher next) async {
  if (action is LoginUser) {
    store.dispatch(StartLoadingAction());
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (action.name.isEmpty || action.pass.isEmpty) {
        Error error = new Error();
        store.dispatch(LoginFailedAction());
        } else {
        store.dispatch(
            LoginSuccessAction(LoginResponse(userId: 1, userName: "Ramesh")));
        Keys.navKey.currentState.pushNamed(Routes.homeScreen);
      }
    });
  }
  next(action);
}
