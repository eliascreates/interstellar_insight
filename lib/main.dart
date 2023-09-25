import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:interstellar_insight/features/home/view/home_page.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getTemporaryDirectory());
  // debugRepaintRainbowEnabled = true;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      )),
      themeMode: ThemeMode.light,
      home: const HomePage(),
    );
  }
}
