import 'package:flutter/material.dart';

import '../data/dummy_categories.dart';
import '../data/dummy_places.dart';
import '../models/place.dart';
import '../widgets/place_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final _controller = TextEditingController();
  String _query = '';
  String _selectedCategory = 'All';

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<Place> get _results {
    final q = _query.trim().toLowerCase();

    return dummyPlaces.where((p) {
      final matchesCategory =
          _selectedCategory == 'All' || p.category == _selectedCategory;
      final matchesQuery =
          q.isEmpty ||
          p.nameEn.toLowerCase().contains(q) ||
          p.nameKh.contains(_query.trim()) ||
          p.province.toLowerCase().contains(q) ||
          p.category.toLowerCase().contains(q);
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void _clear() {
    _controller.clear();
    setState(() => _query = '');
  }

  @override
  Widget build(BuildContext context) {
    final results = _results;
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search field
            TextField(
              controller: _controller,
              onChanged: (v) => setState(() => _query = v),
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                hintText: 'Search place, province, category...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _query.isEmpty
                    ? null
                    : IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: _clear,
                      ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Category filter chips
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final name in [
                    'All',
                    ...dummyCategories.map((c) => c.name),
                  ])
                    Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: ChoiceChip(
                        label: Text(name),
                        selected: _selectedCategory == name,
                        selectedColor: primary,
                        labelStyle: TextStyle(
                          color: _selectedCategory == name
                              ? Theme.of(context).colorScheme.onPrimary
                              : null,
                        ),
                        onSelected: (_) =>
                            setState(() => _selectedCategory = name),
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Result count
            Text(
              '${results.length} result${results.length == 1 ? '' : 's'}',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),

            // Results
            Expanded(
              child: results.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.search_off, size: 64, color: primary),
                          const SizedBox(height: 12),
                          const Text('No places found'),
                          const Text('Try another word or category'),
                        ],
                      ),
                    )
                  : ListView(
                      children: [for (final p in results) PlaceCard(place: p)],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
