import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/user.dart';
import '../providers/favorites_provider.dart';
import '../providers/theme_provider.dart';
import '../routes/app_routes.dart';
import '../utils/app_colors.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  Future<void> _confirmLogout(BuildContext context) async {
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Do you want to log out?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Logout'),
          ),
        ],
      ),
    );

    if (ok == true && context.mounted) {
      // rootNavigator: true is required because each tab has its own Navigator.
      Navigator.of(
        context,
        rootNavigator: true,
      ).pushNamedAndRemoveUntil(AppRoutes.login, (_) => false);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const user = User(name: 'Sok Dara', email: 'dara@example.com');
    final isDark = ref.watch(themeProvider) == ThemeMode.dark;
    final favCount = ref.watch(favoritesProvider).length;
    final primary = Theme.of(context).colorScheme.primary;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        surfaceTintColor: Colors.transparent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Avatar + name
          Center(
            child: CircleAvatar(
              radius: 52,
              backgroundColor: primary.withValues(alpha: 0.2),
              child: Icon(Icons.person, size: 56, color: primary),
            ),
          ),
          const SizedBox(height: 12),
          Center(
            child: Text(
              user.name,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Center(child: Text(user.email)),
          const SizedBox(height: 24),

          // Stats
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _Stat(label: 'Saved', value: '$favCount'),
                  const _Stat(label: 'Visited', value: '0'),
                  const _Stat(label: 'Reviews', value: '0'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Settings
          Card(
            child: Column(
              children: [
                SwitchListTile(
                  secondary: Icon(
                    isDark ? Icons.dark_mode : Icons.light_mode,
                    color: primary,
                  ),
                  title: const Text('Dark mode'),
                  subtitle: Text(isDark ? 'Dark theme' : 'Light theme'),
                  value: isDark,
                  onChanged: ref.read(themeProvider.notifier).setDark,
                ),
                const Divider(height: 1, color: AppColors.lightSecondary),
                ListTile(
                  leading: Icon(Icons.language, color: primary),
                  title: const Text('Language'),
                  trailing: const Text('English'),
                ),
                const Divider(height: 1, color: AppColors.lightSecondary),
                ListTile(
                  leading: Icon(Icons.info_outline, color: primary),
                  title: const Text('About'),
                  trailing: const Text('v1.0.0'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Logout
          Card(
            child: ListTile(
              leading: const Icon(Icons.logout, color: Colors.redAccent),
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.redAccent),
              ),
              onTap: () => _confirmLogout(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String label;
  final String value;

  const _Stat({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        const SizedBox(height: 4),
        Text(label),
      ],
    );
  }
}
