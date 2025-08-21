import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/Commans/button.dart';
import 'package:fluttertest/core/themes/text_style.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/bloc/Users_Cubit.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/reponsiveness/DesktopBody.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/reponsiveness/mobilebody.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/reponsiveness/reponsive_layout.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/widgets/app_drawer.dart';

class ResponsivePage extends StatefulWidget {
  const ResponsivePage({super.key});

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  @override
  void initState() {
    context.read<UsersCubit>().fetchUsers();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("Chat App", style: ApptextStyle.appBarTitle),
          leading:
              MediaQuery.of(context).orientation == Orientation.portrait
                  ? Builder(
                    builder:
                        (context) => IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            Scaffold.of(context).openDrawer();
                          },
                        ),
                  )
                  : null,
          actions: [AppBarButtons()],
        ),
        drawer:
            MediaQuery.of(context).orientation == Orientation.portrait
                ? const AppDrawer()
                : null,
        body: ReponsiveLayout(
          mobilebody: const mobilebody(),
          desktopBody: const desktopBody(),
        ),
        floatingActionButton: FloatingActionButton.extended(
          backgroundColor: const Color.fromARGB(255, 109, 21, 124),
          label: Text("New Chat", style: ApptextStyle.fabText),
          onPressed: () {},
        ),
      ),
    );
  }
}
