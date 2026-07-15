import 'dart:ui';

import 'package:pokedex_app/core/theme/color_const.dart';

Color getPokemonColor(String? type) {
  if (type == null) return const Color(0xFFF37D32);
  return typeColors[type.toLowerCase()] ?? const Color(0xFFF37D32);
}
