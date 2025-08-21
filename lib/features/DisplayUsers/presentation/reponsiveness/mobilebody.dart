import 'package:flutter/material.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/screens/Home.dart';

class mobilebody extends StatefulWidget {
  const mobilebody({super.key});

  @override
  State<mobilebody> createState() => _mobilebodyState();
}

class _mobilebodyState extends State<mobilebody> {
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}
