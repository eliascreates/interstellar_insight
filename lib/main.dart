import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/characters/characters.dart';
import 'features/episodes/episodes.dart';
import 'features/home/home.dart';
import 'features/locations/locations.dart';
import 'features/splash/splash.dart';
import 'features/theme/theme.dart';
import 'service_locator.dart' as di;

Future<void> main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersBloc(
            getAllCharacters: di.sl<GetAllCharacters>(),
            getCharacterById: di.sl<GetCharacterById>(),
          )..add(const CharactersFetchedAll()),
        ),
        BlocProvider(
          create: (context) => EpisodesBloc(
            getAllEpisodes: di.sl<GetAllEpisodes>(),
            getEpisodeById: di.sl<GetEpisodeById>(),
          )..add(const EpisodesFetchedAll()),
        ),
        BlocProvider(
          create: (context) => LocationsBloc(
              getAllLocations: di.sl<GetAllLocations>(),
              getLocationById: di.sl<GetLocationById>())
            ..add(const LocationsFetchedAll()),
        ),
        BlocProvider(create: (context) => HomeCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = context.select(
      (ThemeCubit cubit) => cubit.state.mode(),
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interstellar Insight App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.light,
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: Colors.deepPurple,
        ),
        canvasColor: const Color(0xff303030),
        scaffoldBackgroundColor: const Color(0xff303030),
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xff303030)),
        useMaterial3: true,
      ),
      themeMode: themeMode,
      home: const SplashPage(),
    );
  }
}
