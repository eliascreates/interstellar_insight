import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';
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
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 1, color: Theme.of(context).disabledColor)),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: NetworkImage(character.imageUrl),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Transform.translate(
                offset: const Offset(60 / 3, 0),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.circle,
                      color: character.cleanStatus.color, size: 15),
                ),
              ),
            ),
          ],
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
