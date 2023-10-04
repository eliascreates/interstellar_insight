import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/features/characters/characters.dart';
import 'package:interstellar_insight/features/episodes/presentation/bloc/episodes_bloc.dart';
import 'package:interstellar_insight/features/splash/view/splash_page.dart';
import 'features/episodes/domain/domain.dart';
import 'features/home/home.dart';
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
          create: (context) => HomeCubit(),
        ),
      ],
      child: const MyAppView(),
    );
  }
}

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});

  @override
  Widget build(BuildContext context) {
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
      ),
      themeMode: ThemeMode.light,
      home: const SplashPage(),
    );
  }
}
