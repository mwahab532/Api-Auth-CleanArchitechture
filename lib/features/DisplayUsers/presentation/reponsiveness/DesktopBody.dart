import 'package:flutter/material.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/screens/Home.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/widgets/app_drawer.dart';

class desktopBody extends StatefulWidget {
  const desktopBody({super.key});

  @override
  State<desktopBody> createState() => _desktopBodyState();
}

class _desktopBodyState extends State<desktopBody> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(width: 220, child: const AppDrawer()),
        const Expanded(child: Home(),),
      ],
    );
  }
}
