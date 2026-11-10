import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/place.dart';
import '../providers/favorites_provider.dart';
import '../utils/app_colors.dart';
import '../widgets/highlight_item.dart';
import '../widgets/place_image.dart';
import '../widgets/section_title.dart';

class PlaceDetailScreen extends ConsumerWidget {
  final Place place;

  const PlaceDetailScreen({super.key, required this.place});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isFav = ref.watch(favoritesProvider).contains(place.id);
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: PlaceImage(path: place.imageUrl, height: 280),
            ),
            actions: [
              CircleAvatar(
                backgroundColor: Colors.black45,
                child: IconButton(
                  icon: Icon(
                    isFav ? Icons.favorite : Icons.favorite_border,
                    color: isFav ? primary : Colors.white,
                  ),
                  onPressed: () =>
                      ref.read(favoritesProvider.notifier).toggle(place.id),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.nameEn,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(place.nameKh, style: const TextStyle(fontSize: 16)),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 18),
                      Text(' ${place.province}   '),
                      const Icon(Icons.star, color: AppColors.star, size: 18),
                      Text(' ${place.rating}'),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _InfoRow(
                    icon: Icons.category,
                    label: 'Category',
                    value: place.category,
                  ),
                  const SectionTitle('About'),
                  Text(place.description, style: const TextStyle(height: 1.5)),
                  const SectionTitle('Highlights'),
                  for (final h in place.highlights) HighlightItem(h),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text('$label: ', style: const TextStyle(fontWeight: FontWeight.w600)),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }
}
