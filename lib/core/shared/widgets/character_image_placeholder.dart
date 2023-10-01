import 'package:flutter/material.dart';

class CharacterImagePlaceholder extends StatelessWidget {
  const CharacterImagePlaceholder({
    super.key,
    this.height,
    this.width,
    this.shape = BoxShape.rectangle,
    this.color = Colors.white,
  });
  final double? height;
  final double? width;
  final Color color;
  final BoxShape shape;
  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;

    return Container(
      height: height,
      width: width,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [shadowColor.withOpacity(0.3), Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.center,
        ),
      ),
      decoration: BoxDecoration(
        shape: shape,
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
