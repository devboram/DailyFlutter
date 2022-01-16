import 'package:daily_flutter/provider/counter_provider.dart';
import 'package:daily_flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      /// MultiProvider: 여러개의 Provider 사용
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
                create: (BuildContext context) => CounterProvider()
            ),
          ],
          child: const Home()
      ),

      /// 단독으로 Provider 사용
      // home: ChangeNotifierProvider(
      //   create: (BuildContext context) => CounterProvider(),
      //   child: Home(),
      // ),
    );
  }
}
