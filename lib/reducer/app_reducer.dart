import 'package:flutter_app/app_state/app_state.dart';
import 'package:flutter_app/reducer/user_reducer.dart';
import 'package:redux/redux.dart';

AppState appReducer(AppState appState, action)
{
  return AppState(userState: userReducer(appState.userState,action));
}
