import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/theme_app.dart';
import 'package:pokedex_app/presentation/modules/splash/view/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokedex App',
      debugShowCheckedModeBanner: false,
      //theme: ThemeApp.lightTheme,
      darkTheme: ThemeApp.darkTheme,
      //Mostrar el Splash de inicio
      home: const SplashScreen(),
    );
  }
}
