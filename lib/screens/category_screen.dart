import 'package:flutter/material.dart';

import '../data/dummy_places.dart';
import '../widgets/place_card.dart';

class CategoryScreen extends StatelessWidget {
  final String category;

  const CategoryScreen({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    final places = dummyPlaces.where((p) => p.category == category).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      body: places.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.travel_explore,
                    size: 64,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(height: 12),
                  const Text('No places in this category yet'),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Text(
                  '${places.length} place${places.length > 1 ? 's' : ''} found',
                ),
                const SizedBox(height: 12),
                for (final p in places) PlaceCard(place: p),
              ],
            ),
    );
  }
}
