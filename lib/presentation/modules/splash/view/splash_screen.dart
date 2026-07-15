import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pokedex_app/core/di/injection_container.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/screens/home/view/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    // Configura la animación para que gire indefinidamente
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _initializeApp();
  }

  Future<void> _initializeApp() async {
    //Ejecucion de la carga asincrona de GetIt(Bloc)
    await initDependencies();

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _animationController.value * 2 * math.pi,
                  child: child,
                );
              },
              child: const Icon(
                Icons.catching_pokemon,
                size: 120,
                color: colorWhite,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'POKEDEX',
              style: TextStyle(
                color: colorWhite,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: 4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
