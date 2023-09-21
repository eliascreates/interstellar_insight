import 'package:flutter/material.dart';

class DotIndicators extends StatelessWidget {
  final int numOfPages;
  final double currentIndex;
  final PageController controller;

  const DotIndicators({
    super.key,
    required this.controller,
    required this.numOfPages,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        numOfPages,
        (index) {
          return GestureDetector(
            onTap: () => controller.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            ),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              margin: const EdgeInsets.symmetric(horizontal: 5),
              child: Icon(
                index == currentIndex.round()
                    ? Icons.circle
                    : Icons.circle_outlined,
                color: iconColor?.withAlpha(153),
                size: 8,
              ),
            ),
          );
        },
      ),
    );
  }
}
