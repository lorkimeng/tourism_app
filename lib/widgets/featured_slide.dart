import 'package:flutter/material.dart';

import '../models/place.dart';
import '../screens/place_detail_screen.dart';
import '../utils/app_colors.dart';
import 'place_image.dart';

class FeaturedSlide extends StatelessWidget {
  final Place place;

  const FeaturedSlide({super.key, required this.place});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => PlaceDetailScreen(place: place)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(
          fit: StackFit.expand,
          children: [
            PlaceImage(path: place.imageUrl, height: 220),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    place.nameEn,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    place.nameKh,
                    style: const TextStyle(color: Colors.white70),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.white70,
                      ),
                      Text(
                        ' ${place.province}   ',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      const Icon(Icons.star, size: 16, color: AppColors.star),
                      Text(
                        ' ${place.rating}',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
