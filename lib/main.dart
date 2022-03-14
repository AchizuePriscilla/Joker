import 'package:flutter/material.dart';
import 'package:joker/presentation/views/splash_screen.dart';
import 'package:joker/utils/locator.dart';
import 'package:joker/utils/providers.dart';
import 'package:provider/provider.dart';

void main() async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers,
      builder: (context, child) {
        return const MaterialApp(
          title: 'Joker',
          home: SplashScreen(),
        );
      },
    );
  }
}
