import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';
import 'package:pokedex_app/presentation/screens/home/widgets/show_sort_dialog_w.dart';

class SearchBarW extends StatefulWidget {
  const SearchBarW({super.key});

  @override
  State<SearchBarW> createState() => _SearchBarWState();
}

class _SearchBarWState extends State<SearchBarW> {
  final TextEditingController _searchController = TextEditingController();

  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _searchController.text.trim().isEmpty) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: TextField(
                focusNode: _focusNode,
                style: const TextStyle(
                  color: greyColorS600,
                  fontSize: 14,
                ),
                controller: _searchController,
                decoration: const InputDecoration(
                  hintStyle: TextStyle(color: greyColorS600),
                  hintText: 'Buscar Pokemon...',
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12),
                  prefixIcon: Icon(Icons.search, color: defaultColor),
                ),
                onChanged: _performSearch,
                onSubmitted: (_) => _focusNode.unfocus(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          const CircleAvatar(
            backgroundColor: Colors.white,
            child: ShowSortDialogW(),
          ),
        ],
      ),
    );
  }

  void _performSearch(String query) {
    if (query.trim().isEmpty) {
      _focusNode.unfocus();
      _searchController.clear();

      context.read<PokemonBloc>().add(const SearchPokemonEvent(query: ''));
      setState(() {});
      return;
    }
    context.read<PokemonBloc>().add(SearchPokemonEvent(query: query));
  }
}
