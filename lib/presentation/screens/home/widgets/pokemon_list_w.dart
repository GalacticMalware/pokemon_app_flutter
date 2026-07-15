import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/di/injection_container.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_state.dart';
import 'package:pokedex_app/presentation/screens/detail/view/detail_view.dart';
import 'package:pokedex_app/presentation/screens/home/widgets/empty_state_w.dart';
import 'package:pokedex_app/presentation/widgets/pokemon_card.dart';

class PokemonListW extends StatelessWidget {
  const PokemonListW({
    super.key,
    required this.pokemonState,
    required this.scrollController,
  });

  final PokemonLoaded pokemonState;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    final displayList = pokemonState.displayList;
    if (displayList.isEmpty) {
      return const EmptyStateW();
    }
    return GridView.builder(
      controller: scrollController,
      padding: const EdgeInsets.all(2.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.72,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: displayList.length + (pokemonState.isLoadingMore ? 1 : 0),
      itemBuilder: (context, index) {
        if (index >= displayList.length && pokemonState.isLoadingMore) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        final pokemon = displayList[index];
        return PokemonCard(
          pokemon: pokemon,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BlocProvider(
                  create: (context) => getIt<PokemonDetailBloc>(),
                  child: DetailView(pokemonId: pokemon.id),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
