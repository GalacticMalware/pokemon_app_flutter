import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/screens/home/widgets/sort_bottom_sheet_content_w.dart';

class ShowSortDialogW extends StatefulWidget {
  const ShowSortDialogW({super.key});

  @override
  State<ShowSortDialogW> createState() => _ShowSortDialogWState();
}

class _ShowSortDialogWState extends State<ShowSortDialogW> {
  @override
  Widget build(BuildContext context) {
    final pokemonBloc = context.read<PokemonBloc>();
    return CustomPopup(
        showArrow: false,
        barrierColor: const Color.fromARGB(
            139, 0, 0, 0), // Mantiene la Pokédex visible detrás
        contentPadding: EdgeInsets.zero,
        contentDecoration: BoxDecoration(
          color: colorWhite,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        content: BlocProvider.value(
          value: pokemonBloc,
          child: const SortBottomSheetContent(),
        ),
        child: Container(
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
            color: colorWhite,
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Text(
              '#',
              style: TextStyle(
                  color: defaultColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ));
  }
}
