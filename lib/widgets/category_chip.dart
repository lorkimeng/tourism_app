import 'package:flutter/material.dart';

import '../models/category.dart';
import '../screens/category_screen.dart';

class CategoryChip extends StatelessWidget {
  final Category category;

  const CategoryChip({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: ActionChip(
        avatar: Icon(category.icon, size: 18),
        label: Text(category.name),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => CategoryScreen(category: category.name),
          ),
        ),
      ),
    );
  }
}
