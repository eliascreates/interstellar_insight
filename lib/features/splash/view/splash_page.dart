import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/features/characters/presentation/bloc/characters_bloc.dart';
import 'package:interstellar_insight/features/home/home.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final openApp = context.select(
      (CharactersBloc bloc) => bloc.state.characters.isNotEmpty,
    );

    if (openApp) {
      Future.delayed(Duration.zero, () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    }

    return Scaffold(
      body: Center(
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Image.asset(
            'assets/images/intro.jpeg',
            colorBlendMode: BlendMode.saturation,
            color: Theme.of(context).colorScheme.surfaceTint,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


