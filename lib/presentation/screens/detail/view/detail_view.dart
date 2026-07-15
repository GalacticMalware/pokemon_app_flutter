import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_event.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_state.dart';
import 'package:pokedex_app/presentation/screens/detail/utils/get_pokemon_color.dart';
import 'package:pokedex_app/presentation/screens/detail/widgets/bar_adaptative_w.dart';
import 'package:pokedex_app/presentation/screens/detail/widgets/detail_scaffold_w.dart';
import 'package:pokedex_app/presentation/widgets/loading_widget.dart';

class DetailView extends StatefulWidget {
  final int pokemonId;

  const DetailView({
    super.key,
    required this.pokemonId,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        context.read<PokemonDetailBloc>().add(
              FetchPokemonDetailEvent(pokemonId: widget.pokemonId),
            );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PokemonDetailBloc, PokemonDetailState>(
      listener: (context, state) {
        if (state is PokemonDetailError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error: ${state.message}'),
              backgroundColor: defaultColor,
            ),
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        // Estado de carga
        if (state is PokemonDetailLoading) {
          return const DetailScaffoldW(
            backgroundColor: colorWhite,
            body: LoadingWidget(),
          );
        }

        // Estado de carga exito
        if (state is PokemonDetailSuccess) {
          final pokemon = state.pokemonDetail;

          final String? firstType =
              pokemon.types.isNotEmpty ? pokemon.types[0] : null;

          return DetailScaffoldW(
            backgroundColor: getPokemonColor(firstType),
            body: SafeArea(
              child: BarAdaptativeW(pokemonDetail: pokemon),
            ),
          );
        }

        //Carga de errores
        if (state is PokemonDetailError) {
          return DetailScaffoldW(
            backgroundColor: colorWhite,
            body: Center(child: Text('Error: ${state.message}')),
          );
        }

        return const DetailScaffoldW(
          backgroundColor: colorWhite,
          body: Center(
            child: CircularProgressIndicator(color: defaultColor),
          ),
        );
      },
    );
  }
}
