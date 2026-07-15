import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/core/utils/app_fonst_util.dart';

//Configuracion de tema en la app

class ThemeApp {
  const ThemeApp._();

  static ThemeData get lightTheme => _buildTheme(Brightness.light);
  static ThemeData get darkTheme => _buildTheme(Brightness.dark);

  static ThemeData _buildTheme(Brightness brightness) {
    return ThemeData(
      fontFamily: AppFontsUtil.area,
      brightness: brightness,
      primaryColor: defaultColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: defaultColor,
        primary: defaultColor,
        brightness: brightness,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: defaultColor,
        centerTitle: false,
        iconTheme: IconThemeData(color: Colors.white),
      ),
    );
  }
}
