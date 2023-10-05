import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/locations_bloc.dart';
import 'location_card.dart';

class LocationList extends StatelessWidget {
  const LocationList({super.key});

  @override
  Widget build(BuildContext context) {
    final locations = context.select((LocationsBloc bloc) => bloc.state.locations);

    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemCount: locations.length,
      padding: const EdgeInsets.all(20).copyWith(bottom: 40),
      separatorBuilder: (context, i) => const SizedBox(height: 20),
      itemBuilder: (context, index) => LocationCard(location: locations[index]),
    );
  }
}
