import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              // Add navigation logic here (e.g., navigate to home screen)
            },
          ),
          ListTile(
            leading: const Icon(Icons.chat),
            title: const Text('Chats'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              // Add navigation logic here
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context); // Closes the drawer
              // Add navigation logic here
            },
          ),
        ],
      ),
    );
  }
}
