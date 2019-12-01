import 'package:flutter/material.dart';
import 'package:flutter_app/app_state/app_state.dart';
import 'package:flutter_app/reducer/app_reducer.dart';
import 'package:flutter_app/screens/home_screen.dart';
import 'package:flutter_app/screens/login_Screen.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'middlewares/middlewares.dart';
import 'navigation/navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final store = Store<AppState>(
      appReducer,
      initialState: new AppState.initial(),
      middleware: [middleWares]
  );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Flutter Redux Example',
        navigatorKey: Keys.navKey,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: LoginScreen(title: 'Log in'),
        routes: {
          Routes.homeScreen: (context) {
            return HomeScreen();
          },
        },
      ),
    );
  }
}

