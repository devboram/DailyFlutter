import 'package:daily_flutter/controller/movie_controller.dart';
import 'package:daily_flutter/provider/counter_provider.dart';
import 'package:daily_flutter/ui/movie_list.dart';
import 'package:daily_flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  /// provider 을 이용한 counter 예제
  //runApp(const MyCounterApp());

  /// dio http client 를 이용한 api 통신 예제
  runApp(
    ChangeNotifierProvider(
        create: (_) => MovieController(), child: const MyMovieApp()),
  );
}

class MyMovieApp extends StatelessWidget {
  const MyMovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Practice',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MovieApp(),
    );
  }
}

class MyCounterApp extends StatelessWidget {
  const MyCounterApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      /// MultiProvider: 여러개의 Provider 사용
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => CounterProvider()),
      ], child: const Home()),

      /// 단독으로 Provider 사용
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => CounterProvider(),
      //   child: Home(),
      // ),
    );
  }
}
