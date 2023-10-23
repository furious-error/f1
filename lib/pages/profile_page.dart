import 'package:f1_stats/bloc/auth/auth_bloc.dart';
import 'package:f1_stats/bloc/auth/auth_event.dart';
import 'package:f1_stats/utilities/dialogs/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('profile'),
      ),
      floatingActionButton: IconButton(
        onPressed: () async {
          final shouldLogout = await showLogOutDialog(context);
          if (shouldLogout) {
            context.read<AuthBloc>().add(
                  const AuthEventLogOut(),
                );
          }
        },
        icon: Icon(Icons.logout_sharp),
      ),
    );
  }
}
