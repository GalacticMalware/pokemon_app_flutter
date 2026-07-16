import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_event.dart';
import 'package:pokedex_app/presentation/global/utils/capitaliza.dart';
import 'package:pokedex_app/presentation/screens/detail/widgets/feature_item_w.dart';
import 'package:pokedex_app/presentation/screens/detail/widgets/stats_pokemon_w.dart';

class DeatailDataPokemon extends StatelessWidget {
  const DeatailDataPokemon(
      {super.key, required this.pokemon, required this.colorName});

  final String colorName;
  final PokemonDetail pokemon;

  @override
  Widget build(BuildContext context) {
    final Color? colorPokemon = typeColors[colorName];
    return Expanded(
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 150, left: 8, right: 8),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(23),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 6),
                      decoration: BoxDecoration(
                          color: colorPokemon,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(colorName.capitalize(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 20),
                    Text('Acerca de',
                        style: TextStyle(
                            color: colorPokemon,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                    const SizedBox(height: 20),
                    Center(
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FeatureItemW(
                                icon: Icons.scale,
                                value: '${pokemon.weight} Kg',
                                label: 'Peso'),
                            const VerticalDivider(
                              color: greyColor,
                              thickness: 1,
                            ),
                            FeatureItemW(
                                icon: Icons.height,
                                value: '${pokemon.height} m',
                                label: 'Altura'),
                            const VerticalDivider(
                              color: greyColor,
                              thickness: 1,
                            ),
                            FeatureItemW(
                                //value: _pokemon.moves.join('\n'),
                                value: pokemon.moves
                                    .map((move) => move.capitalize())
                                    .take(2)
                                    .join('\n'),
                                label: 'Movimientos'),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(pokemon.descriptionEs,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 14)),
                    const SizedBox(height: 15),
                    Text('Estadísticas básicas',
                        style: TextStyle(
                            color: colorPokemon,
                            fontWeight: FontWeight.bold,
                            fontSize: 16)),
                    const SizedBox(height: 15),
                    StatsPokemonW(
                      pokemonDetail: pokemon,
                      colorPokemon: colorPokemon,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left,
                        color: Colors.white, size: 35),
                    onPressed: pokemon.id > 1
                        ? () => _navigateToPokemon(context, pokemon.id - 1)
                        : null,
                  ),
                  Image.network(pokemon.imageUrl, height: 200),
                  IconButton(
                    icon: const Icon(Icons.chevron_right,
                        color: Colors.white, size: 35),
                    onPressed: pokemon.id < 151
                        ? () => _navigateToPokemon(context, pokemon.id + 1)
                        : null,
                  ),
                ]),
          ),
        ],
      ),
    );
  }

  void _navigateToPokemon(BuildContext context, int newId) {
    context.read<PokemonDetailBloc>().add(
          FetchPokemonDetailEvent(pokemonId: newId),
        );
  }
}
