import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:tourism_app/screens/search_screen.dart';

import 'favorites_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final active = scheme.primary;
    final inactive = scheme.onSurface.withValues(alpha: 0.6);

    return PersistentTabView(
      tabs: [
        PersistentTabConfig(
          screen: const HomeScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.home),
            title: 'Home',
            activeForegroundColor: active,
            inactiveForegroundColor: inactive,
          ),
        ),
        PersistentTabConfig(
          screen: const SearchScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.search),
            title: 'Search',
            activeForegroundColor: active,
            inactiveForegroundColor: inactive,
          ),
        ),
        PersistentTabConfig(
          screen: const FavoritesScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.favorite),
            title: 'Favorites',
            activeForegroundColor: active,
            inactiveForegroundColor: inactive,
          ),
        ),
        PersistentTabConfig(
          screen: const ProfileScreen(),
          item: ItemConfig(
            icon: const Icon(Icons.person),
            title: 'Profile',
            activeForegroundColor: active,
            inactiveForegroundColor: inactive,
          ),
        ),
      ],
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
        navBarDecoration: NavBarDecoration(
          color: scheme.surface,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 8,
            ),
          ],
        ),
      ),
    );
  }
}
