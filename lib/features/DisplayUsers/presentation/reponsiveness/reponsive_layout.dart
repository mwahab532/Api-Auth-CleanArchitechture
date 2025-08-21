import 'package:flutter/material.dart';

class ReponsiveLayout extends StatelessWidget {
  final Widget mobilebody;
  final Widget desktopBody;
  const ReponsiveLayout({
    super.key,
    required this.mobilebody,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobilebody;
        } else {
          return desktopBody;
        }
      },
    );
  }
}
