import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:interstellar_insight/core/extension/character_status.dart';
import 'package:interstellar_insight/core/shared/widgets/shared_widgets.dart';
import '../../domain/domain.dart';
import '../pages/characters_detail_page.dart';

class SimpleCharacterTile extends StatelessWidget {
  const SimpleCharacterTile(
      {super.key, required this.character});
  final Character character;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CharactersDetailPage(character: character, widgetName: 'SimpleCharacterTile'),
          ),
        ),
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Stack(
          alignment: Alignment.center,
          children: [
            Hero(
              tag: '${character.imageUrl}-SimpleCharacterTile',
              transitionOnUserGestures: true,
              child: CachedNetworkImage(
                  imageUrl: character.imageUrl,
                  placeholder: (context, url) => CharacterImagePlaceholder(
                        height: 60,
                        width: 60,
                        shape: BoxShape.circle,
                        color: character.cleanStatus.color.withOpacity(0.2),
                      ),
                  imageBuilder: (context, imageProvider) {
                    return Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        color: character.cleanStatus.color.withOpacity(0.2),
                        shape: BoxShape.circle,
                        border: Border.all(
                            width: 1, color: Theme.of(context).disabledColor),
                        image: DecorationImage(image: imageProvider),
                      ),
                    );
                  }),
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
                  child: Icon(
                    Icons.circle,
                    color: character.cleanStatus.color,
                    size: 15,
                  ),
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
        trailing: const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}
