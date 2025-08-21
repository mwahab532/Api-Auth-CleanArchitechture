import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Commans/shared/bloc/Cubit_themeMode.dart';

class AppBarButtons extends StatelessWidget {
  const AppBarButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: const Icon(Icons.more_vert),
      onSelected: (value) {
        if (value == 'dark_mode') {
          // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          context.read<ThemeCubit>().emit(ThemeMode.dark);
        } else if (value == 'Light_mode') {
           // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
          context.read<ThemeCubit>().emit(ThemeMode.light);
        } else if (value == 'settings') {
          // Handle settings navigation
        }
      },
      itemBuilder:
          (context) => [
            PopupMenuItem(
              value: 'Light_mode',
              child: Row(
                children: const [
                  Icon(Icons.light_mode_outlined, size: 20),
                  SizedBox(width: 8),
                  Text('Light Mode'),
                ],
              ),
            ),
            PopupMenuItem(
              value: 'dark_mode',
              child: Row(
                children: const [
                  Icon(Icons.dark_mode_outlined, size: 20),
                  SizedBox(width: 8),
                  Text('Dark Mode'),
                ],
              ),
            ),

            PopupMenuItem(
              value: 'settings',
              child: Row(
                children: const [
                  Icon(Icons.settings, size: 20),
                  SizedBox(width: 8),
                  Text('Settings'),
                ],
              ),
            ),
          ],
    );
  }
}
