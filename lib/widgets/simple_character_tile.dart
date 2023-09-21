import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/constants/colors.dart';
import 'package:interstellar_insight/models/character.dart';

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
        leading: CircleAvatar(
          backgroundImage: Image.asset(
            character.image,
            alignment: Alignment.topCenter,
            fit: BoxFit.scaleDown,
            semanticLabel: character.description,
          ).image,
          radius: 30,
          child: Container(
            alignment: Alignment.bottomRight,
            padding: const EdgeInsets.only(bottom: 5, right: 5),
            child: Icon(
              Icons.circle,
              size: 10,
              color: (character.status == 'Alive'
                      ? aliveStatusColor
                      : character.status == 'Dead'
                          ? deceasedStatusColor
                          : unknownStatusColor)
                  .withOpacity(0.7),
            ),
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
          "Also known as ${character.alias.first}",
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
