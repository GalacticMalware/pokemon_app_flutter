import 'package:flutter/material.dart';

//Variables de colores

const defaultColor = Color(0xFFDC0A2D);

const colorWhite = Colors.white;

const greyColor = Color(0xB39E9E9E);

const greyColorS600 = Color(0xFF757575);

const blackColor = Colors.black87;

const Map<String, Color> typeColors = {
  'grass': Colors.green,
  'fire': Color(0xFFF57D31),
  'water': Colors.blue,
  'electric': Color(0xFFFBC02D),
  'ice': Colors.cyan,
  'fighting': Color(0xFFB71C1C),
  'poison': Colors.purple,
  'ground': Colors.brown,
  'flying': Colors.indigo,
  'psychic': Colors.pink,
  'bug': Colors.lime,
  'rock': Colors.grey,
  'ghost': Colors.deepPurple,
  'dark': Color(0xFF212121),
  'dragon': Color(0xFF1A237E),
  'steel': Colors.blueGrey,
  'fairy': Color(0xFFF8BBD0),
  'normal': Color(0xFF757575),
};

extension PokemonTypeColorExtension on Map<String, Color> {
  Color getColorForType(String? type) {
    if (type == null) return const Color(0xFFF37D32);
    return this[type.toLowerCase()] ?? const Color(0xFFF37D32);
  }
}
