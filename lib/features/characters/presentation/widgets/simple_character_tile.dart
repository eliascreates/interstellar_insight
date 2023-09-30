import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/constants/colors.dart';
// import 'package:interstellar_insight/models/character.dart';
import '../../domain/domain.dart';

class SimpleCharacterTile extends StatelessWidget {
  const SimpleCharacterTile({super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        onTap: () {},
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Container(
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 1,
              color: (character.status == 'Alive'
                  ? aliveStatusColor
                  : character.status == 'Dead'
                      ? deceasedStatusColor
                      : unknownStatusColor),
            ),
          ),
          child: CircleAvatar(
            backgroundImage: Image(
              image: NetworkImage(character.imageUrl),
              alignment: Alignment.topCenter,
              fit: BoxFit.scaleDown,
              semanticLabel: character.description,
            ).image,
            radius: 30,
          ),
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Text(
                character.name,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
              ),
            ),
            // const SizedBox(width: 10),
            // Icon(
            //   Icons.circle,
            //   size: 10,
            //   color: character.status == 'Alive'
            //       ? aliveStatusColor
            //       : character.status == 'Dead'
            //           ? deceasedStatusColor
            //           : unknownStatusColor,
            // ),
          ],
        ),
        subtitle: Text(
          character.singleAlias,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        subtitleTextStyle: Theme.of(context).textTheme.bodySmall,
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
