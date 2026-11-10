import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../data/dummy_categories.dart';
import '../data/dummy_places.dart';
import '../widgets/category_chip.dart';
import '../widgets/featured_slide.dart';
import '../widgets/place_card.dart';
import '../widgets/section_title.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading = true;
  int _current = 0;

  @override
  void initState() {
    super.initState();
    // Fake loading to show the skeleton effect.
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (!mounted) return;
      setState(() => _loading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    // Top 4 places by rating for the carousel.
    final featured = ([
      ...dummyPlaces,
    ]..sort((a, b) => b.rating.compareTo(a.rating))).take(4).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Cambodia'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      body: Skeletonizer(
        enabled: _loading,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Discover the Kingdom of Wonder',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Carousel
            CarouselSlider(
              items: [
                for (final p in featured)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: FeaturedSlide(place: p),
                  ),
              ],
              options: CarouselOptions(
                height: 220,
                viewportFraction: 0.9,
                enlargeCenterPage: true,
                autoPlay: !_loading,
                autoPlayInterval: const Duration(seconds: 4),
                onPageChanged: (index, reason) =>
                    setState(() => _current = index),
              ),
            ),
            const SizedBox(height: 12),

            // Dots indicator
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < featured.length; i++)
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    height: 8,
                    width: _current == i ? 24 : 8,
                    decoration: BoxDecoration(
                      color: _current == i
                          ? primary
                          : primary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
              ],
            ),

            // Categories
            const SectionTitle('Categories'),
            SizedBox(
              height: 48,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  for (final c in dummyCategories) CategoryChip(category: c),
                ],
              ),
            ),

            // Popular destinations
            const SectionTitle('Popular Destinations'),
            for (final p in dummyPlaces) PlaceCard(place: p),
          ],
        ),
      ),
    );
  }
}
