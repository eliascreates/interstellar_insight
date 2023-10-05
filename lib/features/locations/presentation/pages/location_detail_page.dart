import 'package:flutter/material.dart';

import '../../domain/domain.dart';
import '../widgets/widgets.dart';

class LocationDetailPage extends StatelessWidget {
  const LocationDetailPage({super.key, required this.location});
  final Location location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar.medium(
            iconTheme: const IconThemeData(size: 30),
            title: FittedBox(
              child: Text(
                location.name,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              LocationDetailImage(imageUrl: location.imageUrl),
              LocationDetailBody(location: location),
            ]),
          ),
          if (location.notableResidents.isNotEmpty)
            SliverPadding(
              padding: const EdgeInsets.only(left: 20),
              sliver: SliverToBoxAdapter(
                child: Text(
                  'Notable Residents',
                  style: theme.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200,
              child: LocationInhabitantList(location: location),
            ),
          )
        ],
      ),
    );
  }
}
