import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';
import '../../domain/domain.dart';

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
        CachedNetworkImage(
          imageUrl: character.imageUrl,
          placeholder: (context, url) => _SimpleCardImagePlaceholder(
            height: height,
            color: character.cleanStatus.color,
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
          fit: BoxFit.cover,
          imageBuilder: (context, imageProvider) => Container(
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
                image: imageProvider,
                fit: BoxFit.cover,
              ),
            ),
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
                color: character.cleanStatus.color,
              ),
              const SizedBox(width: 10),
              Text(
                character.firstName,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _SimpleCardImagePlaceholder extends StatelessWidget {
  const _SimpleCardImagePlaceholder({
    required this.height,
    required this.color,
  });

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final shadowColor = Theme.of(context).shadowColor;

    return Container(
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
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}

// class _FeaturedImageCardPlaceholder extends StatelessWidget {
//   const _FeaturedImageCardPlaceholder();

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: double.infinity,
//       width: double.infinity,
//       foregroundDecoration: BoxDecoration(
//         gradient: LinearGradient(
//           colors: [Colors.black.withOpacity(0.3), Colors.transparent],
//           begin: Alignment.bottomCenter,
//           end: Alignment.center,
//         ),
//       ),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//       ),
//     );
//   }
// }
