import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => _QuotesPageState();
}

class _QuotesPageState extends State<QuotesPage> {
  late RiveAnimationController _workController;

  bool _isGlowing = false;

  @override
  void initState() {
    super.initState();
    _workController = _workController = OneShotAnimation(
      'ClickGlow',
      onStop: () => setState(() => _isGlowing = false),
      onStart: () => setState(() => _isGlowing = true),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          onTap: () => _isGlowing ? null : _workController.isActive = true,
          child: Stack(
            children: [
              RiveAnimation.asset(
                'assets/animations/work.riv',
                fit: BoxFit.contain,
                stateMachines: const ['State Machine 1'],
                controllers: [_workController],
              ),
              Positioned(
                left: 20,
                top: 40,
                right: 20,
                child: DefaultTextStyle(
                  style: const TextStyle(
                    color: Colors.amber,
                    fontFamily: 'Philosopher',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    onTap: () =>
                        _isGlowing ? null : _workController.isActive = true,
                    animatedTexts: [
                      TypewriterAnimatedText(
                        '👑',
                        textStyle: const TextStyle(
                          fontFamily: 'NotoColorEmoji',
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 50),
                      ),
                      TypewriterAnimatedText(
                        'Quotes are not here yet',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'In the meantime',
                        speed: const Duration(milliseconds: 100),
                      ),
                      TypewriterAnimatedText(
                        'Tap anywhere to charge the laptop',
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
