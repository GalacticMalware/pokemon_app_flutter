import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:pokedex_app/data/datasources/pokemon_remote_datasource.dart';
import 'package:pokedex_app/data/datasources/pokemon_remote_datasource_impl.dart';
import 'package:pokedex_app/data/repositories/pokemon_repository_impl.dart';
import 'package:pokedex_app/domain/repositories/pokemon_repository.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_detail.dart';
import 'package:pokedex_app/domain/usecases/get_pokemon_list.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_bloc.dart';
import 'package:pokedex_app/presentation/blocs/pokemon_detail/pokemon_detail_bloc.dart';

final getIt = GetIt.instance;

Future<void> initDependencies() async {
  // External
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  // Data Sources
  getIt.registerLazySingleton<PokemonRemoteDataSource>(
    () => PokemonRemoteDataSourceImpl(client: getIt<http.Client>()),
  );

  // Repositories
  getIt.registerLazySingleton<PokemonRepository>(
    () => PokemonRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use Cases
  getIt.registerLazySingleton<GetPokemonList>(() => GetPokemonList(getIt()));
  getIt
      .registerLazySingleton<GetPokemonDetail>(() => GetPokemonDetail(getIt()));

  // BLoC
  getIt.registerFactory<PokemonBloc>(
    () => PokemonBloc(
      getPokemonList: getIt(),
    ),
  );

  getIt.registerFactory<PokemonDetailBloc>(
    () => PokemonDetailBloc(
      getPokemonDetail: getIt<GetPokemonDetail>(),
    ),
  );
}
