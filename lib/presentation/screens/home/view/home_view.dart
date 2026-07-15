import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/di/injection_container.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';
import 'package:pokedex_app/presentation/global/app_bar/app_bar_home.dart';
import 'package:pokedex_app/presentation/screens/home/widgets/body_w.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PokemonBloc>(
      create: (context) => getIt<PokemonBloc>()..add(const LoadPokemonEvent()),
      child: const Scaffold(
        backgroundColor: defaultColor,
        appBar: AppBarHome(),
        body: BodyW(),
      ),
    );
  }
}
