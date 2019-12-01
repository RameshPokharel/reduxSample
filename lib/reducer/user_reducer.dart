import 'package:flutter_app/action/user_action.dart';
import 'package:flutter_app/app_state/user_states.dart';
import 'package:redux/redux.dart';

final userReducer = combineReducers<UserState>([
  TypedReducer<UserState, LoginSuccessAction>(_loginSuccess),
  TypedReducer<UserState, LoginFailedAction>(_loginFailed),
  TypedReducer<UserState, StartLoadingAction>(_startLoading),
]);

UserState _loginSuccess(UserState state, LoginSuccessAction action) {
  return state.copyWith(user: action.user, isLoading: false, loginError: false);
}

UserState _loginFailed(UserState state, LoginFailedAction action) {
  return state.copyWith(user: null, isLoading: false, loginError: true);
}

UserState _startLoading(UserState state, StartLoadingAction action) {
  return state.copyWith(isLoading: true, loginError: false);
}