import 'package:flutter/material.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/domain/entities/pokemon_detail.dart';
import 'package:pokedex_app/presentation/screens/detail/utils/get_name_convert_pokemon.dart';

class StatsPokemonW extends StatelessWidget {
  const StatsPokemonW(
      {super.key, required this.pokemonDetail, required this.colorPokemon});

  final PokemonDetail pokemonDetail;
  final Color? colorPokemon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pokemonDetail.stats.length,
        itemBuilder: (context, index) {
          final s = pokemonDetail.stats[index];
          final baseStat = s.baseStat;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 0),
            child: Row(
              children: [
                SizedBox(
                    width: 30,
                    child: Text(
                        getConvertNamePokemon(name: s.name).toUpperCase(),
                        style: TextStyle(
                            color: colorPokemon, fontWeight: FontWeight.bold))),
                const SizedBox(
                  height: 20,
                  child: VerticalDivider(color: greyColor, thickness: 1),
                ),
                SizedBox(
                    width: 35,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 1),
                      child: Text(baseStat.toString(),
                          style: const TextStyle(color: blackColor)),
                    )),
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: baseStat / 100,
                      color: colorPokemon,
                      backgroundColor: colorPokemon!.withValues(alpha: 0.2),
                      minHeight: 4,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
