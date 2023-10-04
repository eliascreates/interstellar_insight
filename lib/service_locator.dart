import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path_provider/path_provider.dart';

import 'package:interstellar_insight/config/debug/app_observer.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:interstellar_insight/features/episodes/episodes.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //? FEATURES

  //! Characters

  //Usecases
  sl.registerLazySingleton<GetAllCharacters>(() => GetAllCharacters(sl()));
  sl.registerLazySingleton<GetCharacterById>(() => GetCharacterById(sl()));

  //repositories
  sl.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(remoteDataSource: sl()),
  );

  //Datasources
  sl.registerLazySingleton<CharacterRemoteDataSource>(
    () => CharacterRemoteDataSourceImpl(client: sl()),
  );

  //! Episodes

  //Usecases
  sl.registerLazySingleton<GetAllEpisodes>(() => GetAllEpisodes(sl()));
  sl.registerLazySingleton<GetEpisodeById>(() => GetEpisodeById(sl()));

  //repositories
  sl.registerLazySingleton<EpisodeRepository>(
    () => EpisodeRepositoryImpl(remoteDataSource: sl()),
  );

  //Datasources
  sl.registerLazySingleton<RemoteEpisodeDataSource>(
    () => RemoteEpisodeDataSourceImpl(client: sl()),
  );

  //? EXTERNALS
  Bloc.observer = InterstellarObserver();

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());

  sl.registerSingleton<http.Client>(http.Client());

  sl.registerLazySingleton<InternetConnectionChecker>(
    () => InternetConnectionChecker(),
  );
}
