import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/constants/colors.dart';

import '../models/character.dart';

class FeaturedCharacterCard extends StatelessWidget {
  final Character character;
  final int index;
  final double page;
  static late double _cardScale;
  static const double _minScale = 0.85;
  static const double _maxScale = 0.95;
  static const double _scaleDiff = _maxScale - _minScale;

  const FeaturedCharacterCard({
    super.key,
    required this.character,
    required this.index,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    final pageInt = page.toInt();
    final pageFract = page % 1;

    if (index == pageInt) {
      _cardScale = _minScale + (1 - pageFract) * _scaleDiff;
    } else if (index == pageInt + 2) {
      _cardScale = _minScale;
    } else {
      _cardScale = _minScale + pageFract * _scaleDiff;
    }
    final shadowColor = Theme.of(context).shadowColor;

    return Transform.scale(
      scale: _cardScale,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Stack(
          children: [
            //Shadow Below
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 25)
                    .copyWith(bottom: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  // color: Colors.red,
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [shadowColor, Colors.transparent],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 7, sigmaY: 7),
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                ),
              ),
            ),

            //Image
            FractionallySizedBox(
              heightFactor: 0.9,
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: double.infinity,
                      width: double.infinity,
                      foregroundDecoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.3),
                            Colors.transparent
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.center,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(character.image),
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.darken),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  character.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            character.description,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 10),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.circle,
                                  color: character.status == 'Alive'
                                      ? aliveStatusColor
                                      : character.status == 'Dead'
                                          ? deceasedStatusColor
                                          : unknownStatusColor,
                                  size: 10),
                              Text(character.species,
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10)),
                              Text("Origin: ${character.origin}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 10)),
                              const SizedBox(height: 5),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10, right: 10),
                    //   child: Align(
                    //     alignment: Alignment.topRight,
                    //     child: Text(
                    //       '[ ${character.status} ]',
                    //       style: const TextStyle(
                    //         fontWeight: FontWeight.w600,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
