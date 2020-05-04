import 'package:flutter/material.dart';

import 'ui/main_screen.dart';

void main() => runApp(new MyApp());
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Költségek',
      theme: new ThemeData(primarySwatch: Colors.blue),
      home: new MainScreen(routeObserver),
      navigatorObservers: [
        routeObserver
      ],
    );
  }
}
