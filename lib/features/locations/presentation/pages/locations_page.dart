import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: LocationList()));
  }
}