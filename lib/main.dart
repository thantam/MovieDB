import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterasyncredux/core/redux/store.dart';
import 'package:flutterasyncredux/ui/main_page.dart';
import 'package:redux/redux.dart';

import 'core/redux/app/app_state.dart';

void main()  {
  final store = createStore();
  runApp(MovieDBApp(store));
}

class MovieDBApp extends StatefulWidget {
  MovieDBApp(this.store);
  final Store<AppState> store;
  @override
  _MovieDBAppState createState() => _MovieDBAppState();
}

class _MovieDBAppState extends State<MovieDBApp> {
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store,
      child: MaterialApp(
        title: "MovieDB",
        theme: ThemeData(
          primaryColor: const Color(0xFF1C306D),
          accentColor: const Color(0xFFFFAD32),
          scaffoldBackgroundColor: Colors.transparent,
        ),
        home: const MainPage(),
      ),
    );
  }
}