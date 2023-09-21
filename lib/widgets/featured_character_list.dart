import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:interstellar_insight/models/character.dart';
import 'package:interstellar_insight/widgets/featured_character_card.dart';

import 'cubit/featured_character_list_cubit_cubit.dart';
import 'dot_indicators.dart';

class FeaturedCharacterList extends StatefulWidget {
  const FeaturedCharacterList({super.key});

  @override
  State<FeaturedCharacterList> createState() => _FeaturedCharacterListState();
}

class _FeaturedCharacterListState extends State<FeaturedCharacterList> {
  final _pageController = PageController(viewportFraction: 0.7);

  @override
  void initState() {
    super.initState();
    _pageController.addListener(_handlePageChange);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _handlePageChange() {
    context
        .read<FeaturedCharacterListCubit>()
        .handlePageChange(_pageController.page ?? 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        SizedBox(height: screenHeight * 0.05),
        Stack(
          children: [
            SizedBox(
              height: screenHeight * 0.40,
              child: PageView.builder(
                controller: _pageController,
                itemCount: characters.take(6).length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) => FeaturedCharacterCard(
                  character: characters[index],
                  index: index,
                  page: context.watch<FeaturedCharacterListCubit>().state,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: DotIndicators(
                controller: _pageController,
                numOfPages: characters.take(6).length,
                currentIndex: context.watch<FeaturedCharacterListCubit>().state,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.06),
      ],
    );
  }
}
