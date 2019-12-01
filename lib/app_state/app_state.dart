import 'package:flutter_app/app_state/user_states.dart';

class AppState {
  final UserState userState;

  AppState({this.userState});

  factory AppState.initial() {
    return AppState(userState: UserState.initial());
  }

  AppState copyWith(UserState userState) {
    return AppState(userState: userState ?? this.userState);
  }

  @override
  int get hashCode =>
      //isLoading.hash Code ^
  userState.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AppState && userState == other.userState;
}
