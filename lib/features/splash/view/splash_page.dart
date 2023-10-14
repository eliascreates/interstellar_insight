import 'package:flutter/material.dart';
import 'package:interstellar_insight/features/home/home.dart';
import 'dart:async';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    const image = AssetImage('assets/images/intro.jpeg');

    scheduleMicrotask(() async {
      await precacheImage(image, context);
      await Future.delayed(const Duration(milliseconds: 1000), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {

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
