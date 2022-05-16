import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'connectivity.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => ConnectivityProvider(),
            child: splash_screen(),
          ),
        ],
        child: MaterialApp(
            title: 'Yummies BBQ Watford',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: const splash_screen()));
  }
}
