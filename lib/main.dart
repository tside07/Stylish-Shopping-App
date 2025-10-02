import 'package:flutter/material.dart';
import 'utils/routes.dart';
// import 'screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stylish Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.purple, fontFamily: 'FiraSans'),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}
