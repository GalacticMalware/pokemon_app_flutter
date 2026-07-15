import 'package:flutter/material.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/presentation/screens/detail/widgets/detail_data_pokemon_w.dart';

class BarAdaptativeW extends StatelessWidget {
  const BarAdaptativeW({super.key, this.pokemonDetail});

  final PokemonDetail? pokemonDetail;

  @override
  Widget build(BuildContext context) {
    if (pokemonDetail == null) return const SizedBox.shrink();

    final pokemon = pokemonDetail!;
    final colorName = pokemon.types.isNotEmpty ? pokemon.types[0] : 'GRASS';

    return Stack(
      children: [
        Positioned(
          top: -20,
          right: -20,
          child: Icon(Icons.catching_pokemon,
              size: 250, color: Colors.white.withValues(alpha: 0.1)),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                          iconSize: 30,
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back),
                          color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Text(pokemon.name,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                  Text('#${pokemon.id.toString().padLeft(3, '0')}',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            DeatailDataPokemon(
              pokemon: pokemon,
              colorName: colorName,
            )
          ],
        ),
      ],
    );
  }
}
