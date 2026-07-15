import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/color_const.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: defaultColor,
      title: const Row(
        children: [
          Icon(Icons.catching_pokemon, color: colorWhite, size: 30),
          SizedBox(width: 10),
          Text(
            'Pokedex',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: colorWhite,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
