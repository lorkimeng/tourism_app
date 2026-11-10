import 'package:flutter/material.dart';

class PlaceImage extends StatelessWidget {
  final String path;
  final double height;

  const PlaceImage({super.key, required this.path, required this.height});

  @override
  Widget build(BuildContext context) {
    final placeholderColor = Theme.of(context)
        .colorScheme
        .surfaceContainerHighest;

    final fallback = Container(
      height: height,
      width: double.infinity,
      color: placeholderColor,
      child: const Icon(Icons.image_not_supported, size: 40),
    );

    // URL from the internet
    if (path.startsWith('http')) {
      return Image.network(
        path,
        height: height,
        width: double.infinity,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          final total = progress.expectedTotalBytes;
          return Container(
            height: height,
            width: double.infinity,
            color: placeholderColor,
            child: Center(
              child: CircularProgressIndicator(
                value: total != null
                    ? progress.cumulativeBytesLoaded / total
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (_, _, _) => fallback,
      );
    }

    // Local file in assets
    return Image.asset(
      path,
      height: height,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (_, _, _) => fallback,
    );
  }
}
