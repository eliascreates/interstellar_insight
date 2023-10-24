import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  const DetailTag({
    super.key,
    required this.tagName,
    this.tagValue,
    this.backgroundColor,
    this.foregroundColor = Colors.black,
  });

  final String tagName;
  final String? tagValue;
  final Color? backgroundColor;
  final Color? foregroundColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.amberAccent.shade200,
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
          Container(
            constraints: const BoxConstraints(maxWidth: 300),
            child: Text(
              tagValue != null ? "$tagName: " : tagName,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: theme.textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: foregroundColor,
              ),
            ),
          ),
          if (tagValue case final tagValue?)
            Text(tagValue, style: TextStyle(color: foregroundColor)),
        ],
      ),
    );
  }
}
