import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: EpisodeList()));
  }
}
