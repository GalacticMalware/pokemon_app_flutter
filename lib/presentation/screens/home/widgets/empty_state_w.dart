import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/color_const.dart';

class EmptyStateW extends StatelessWidget {
  const EmptyStateW({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: 80,
            color: greyColor,
          ),
          SizedBox(height: 16),
          Text(
            'No se encontraron Pokémon',
            style: TextStyle(
              fontSize: 18,
              color: greyColorS600,
            ),
          ),
        ],
      ),
    );
  }
}
