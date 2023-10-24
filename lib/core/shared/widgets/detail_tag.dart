import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  const DetailTag({
    super.key,
    required this.tagName,
    this.tagValue,
    this.color,
  });

  final String tagName;
  final String? tagValue;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: color ?? Colors.amberAccent.shade200,
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
            tagValue != null ? "$tagName: " : tagName,
            style: theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          if (tagValue case final tagValue?)
            Text(tagValue, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}
