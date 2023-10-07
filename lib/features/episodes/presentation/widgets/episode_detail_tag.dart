part of 'episode_detail_body.dart';

class EpisodeDetailTag extends StatelessWidget {
  const EpisodeDetailTag({
    super.key,
    required this.tagName,
    required this.tagValue,
  });

  final String tagName;
  final String tagValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      margin: const EdgeInsets.only(bottom: 10.0),
      decoration: BoxDecoration(
        color: Colors.amberAccent.shade200,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: theme.shadowColor.withOpacity(0.2),
            blurRadius: 1,
            spreadRadius: 1,
            offset: const Offset(1, 2),
          )
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "$tagName: ",
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(tagValue, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
