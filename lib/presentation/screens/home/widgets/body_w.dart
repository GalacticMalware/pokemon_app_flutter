import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex_app/core/theme/color_const.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_state.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_state.dart';
import 'package:pokedex_app/presentation/screens/home/widgets/pokemon_list_w.dart';
import 'package:pokedex_app/presentation/screens/home/widgets/search_bar_w.dart';
import 'package:pokedex_app/presentation/widgets/error_widget.dart';
import 'package:pokedex_app/presentation/widgets/loading_widget.dart';

class BodyW extends StatefulWidget {
  const BodyW({super.key});

  @override
  State<BodyW> createState() => _BodyWState();
}

class _BodyWState extends State<BodyW> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    final bloc = context.read<PokemonBloc>();
    final state = bloc.state;

    if (state is PokemonLoaded &&
        !state.isLoadingMore &&
        !state.hasReachedMax &&
        _scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 200) {
      bloc.add(const LoadMorePokemonEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SearchBarW(),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                  color: colorWhite,
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: BlocConsumer<PokemonBloc, PokemonState>(
                listener: (context, state) {
                  if (state is PokemonError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Error: ${state.failure.message}'),
                        backgroundColor: defaultColor,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is PokemonLoaded) {
                    return PokemonListW(
                      pokemonState: state,
                      scrollController: _scrollController,
                    );
                  }

                  if (state is PokemonLoading) {
                    return const LoadingWidget();
                  }

                  if (state is PokemonError) {
                    return CustomErrorWidget(
                      message: state.failure.message,
                      onRetry: () {
                        context
                            .read<PokemonBloc>()
                            .add(const LoadPokemonEvent());
                      },
                    );
                  }
                  if (state is PokemonDetailState) {
                    return const LoadingWidget();
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
