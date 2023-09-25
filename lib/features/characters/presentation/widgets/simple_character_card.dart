import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/constants/colors.dart';
import 'package:interstellar_insight/models/character.dart';

class SimpleCharacterCard extends StatelessWidget {
  const SimpleCharacterCard({
    super.key,
    required this.character,
    required this.height,
  });

  final Character character;
  final double height;

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;
    return Stack(
      children: [
        Container(
          height: height,
          foregroundDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [shadowColor.withOpacity(0.2), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.center,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).shadowColor.withOpacity(0.2),
                blurRadius: 1,
                spreadRadius: 1,
                offset: const Offset(0, 1),
              )
            ],
            image: DecorationImage(
                image: AssetImage(character.image), fit: BoxFit.cover),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 10,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.circle,
                size: 10,
                color: character.status == 'Alive'
                    ? aliveStatusColor
                    : character.status == 'Dead'
                        ? deceasedStatusColor
                        : unknownStatusColor,
              ),
              const SizedBox(width: 10),
              Text(
                character.name.split(' ').first,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              )
            ],
          ),
        )
      ],
    );
  }
}
