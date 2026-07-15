import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_state.dart';

class SortBottomSheetContent extends StatelessWidget {
  const SortBottomSheetContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: const BoxDecoration(
              color: defaultColor,
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10), bottom: Radius.circular(10)),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Text(
                  'Ordenar por',
                  style: TextStyle(
                      color: colorWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                const SizedBox(height: 10),
                Card(
                  color: colorWhite,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      children: [
                        BlocBuilder<PokemonBloc, PokemonState>(
                          builder: (context, state) {
                            SortOption currentSort = SortOption.number;

                            if (state is PokemonLoaded) {
                              currentSort = state.sortOption;
                            }
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                _buildSortOption(
                                  context,
                                  SortOption.number,
                                  currentSort,
                                ),
                                _buildSortOption(
                                  context,
                                  SortOption.name,
                                  currentSort,
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSortOption(
    BuildContext context,
    SortOption option,
    SortOption currentSort,
  ) {
    final String label = option.name == 'number' ? 'Numero' : 'Nombre';
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
        child: Row(
          children: [
            Radio<SortOption>(
              value: option,
              groupValue: currentSort,
              activeColor: defaultColor,
              onChanged: (value) {
                if (value != null) {
                  context.read<PokemonBloc>().add(
                        SortPokemonEvent(sortOption: value),
                      );
                  Navigator.pop(context);
                }
              },
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
