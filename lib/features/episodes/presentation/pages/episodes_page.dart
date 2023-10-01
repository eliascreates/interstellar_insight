import 'package:flutter/material.dart';
import 'package:interstellar_insight/features/episodes/presentation/widgets/episode_list.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: EpisodeList()));
  }
}
