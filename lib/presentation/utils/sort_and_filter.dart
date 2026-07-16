import 'package:pokedex_app/domain/entities/pokemon.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_event.dart';

List<Pokemon> filterPokemonList(List<Pokemon> list, String query) {
  return list
      .where((pokemon) => pokemon.name.toLowerCase().contains(query))
      .toList();
}

List<Pokemon> sortPokemonList(List<Pokemon> list, SortOption option) {
  final sorted = List<Pokemon>.from(list);
  switch (option) {
    case SortOption.number:
      sorted.sort((a, b) => a.id.compareTo(b.id));
      break;
    case SortOption.name:
      sorted.sort((a, b) => a.name.compareTo(b.name));
      break;
  }
  return sorted;
}
