import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/bloc/User_CubitState.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/bloc/Users_Cubit.dart';
import 'package:fluttertest/features/DisplayUsers/presentation/controllers/controllers.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Center(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth:400),
                  child: TextField(
                    onChanged: (value) {
                      context.read<UsersCubit>().searchUsers(value);
                    },
                    controller: textFeildControllers().searchTextController,
                    decoration: InputDecoration(
                      hintText: "Search here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    cursorHeight: 20,
                  ),
                ),
              ),
            ),
            buildbody(),
          ],
        ),
      ),
    );
  }

  Widget buildbody() {
    return Expanded(
      child: BlocBuilder<UsersCubit, UserCubitstate>(
        builder: (context, state) {
          if (state is UserStateloading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is UserStateloaded) {
            final filteredUsers = state.filteredUsers;

            if (filteredUsers.isEmpty) {
              return const Center(child: Text("No users found"));
            }
            return ListView.builder(
              itemCount: filteredUsers.length,
              itemBuilder: (context, index) {
                final user = filteredUsers[index];
                return ListTile(
                  leading:
                      user.avatar != null
                          ? CircleAvatar(
                            backgroundImage: NetworkImage(user.avatar!),
                          )
                          : const CircleAvatar(child: Icon(Icons.person)),
                  title: Text("${user.firstName} ${user.lastName}"),
                  subtitle: Text(user.email ?? 'No Email'),
                  onTap: () {},
                );
              },
            );
          } else if (state is UserErrorState) {
            return const Center(child: Text("Failed to fetch users"));
          }

          return const Center(child: Text("Initializing..."));
        },
      ),
    );
  }
}
