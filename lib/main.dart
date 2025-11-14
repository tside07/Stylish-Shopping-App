import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stylish_shopping_app/core/theme/theme_provider.dart';
import 'utils/routes.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          title: 'Stylish Shopping App',
          debugShowCheckedModeBanner: false,
          theme: themeProvider.currentTheme,
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}
