import 'package:flutter/material.dart';
import 'package:test001/components/my_drawer_tile.dart';
import 'package:test001/services/auth/auth_gate.dart';
import 'package:test001/services/auth/auth_services.dart';
import 'package:test001/settings_page.dart';

import '../login_page.dart';
class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    final authServices = AuthService();
    authServices.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
                Icons.lock_open_outlined,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list
          MyDrawerTile(
              onTap: () => Navigator.pop(context),
              text: "H O M E",
              icon: Icons.home_rounded
          ),

          //settings
          MyDrawerTile(
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SettingsPage(),
                 ),
                );
              },
              text: "S E T T I N G S",
              icon: Icons.settings
          ),

          const Spacer(),
          //logout
          MyDrawerTile(
              onTap: ()  {
                logout();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthGate(),
                ),
                );
              },
              text: "L O G O U T",
              icon: Icons.logout_rounded
          ),
          const SizedBox(height: 25),

        ],
      ),
    );
  }
}
