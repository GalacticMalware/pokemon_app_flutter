import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/color_const.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 60,
            width: 60,
            child: CircularProgressIndicator(strokeWidth: 4),
          ),
          SizedBox(height: 16),
          Text(
            'Cargando Pokemon...',
            style: TextStyle(fontSize: 16, color: defaultColor),
          ),
        ],
      ),
    );
  }
}
