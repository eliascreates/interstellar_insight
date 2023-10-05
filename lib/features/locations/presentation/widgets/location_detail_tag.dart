part of 'location_detail_body.dart';

class LocationDetailTag extends StatelessWidget {
  const LocationDetailTag({super.key, required this.inhabitant});

  final String inhabitant;

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
      child: Text(
        inhabitant,
        style: theme.textTheme.bodyLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}