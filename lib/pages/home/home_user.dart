import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({super.key});

  @override
  State<HomeUser> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              final SharedPreferences shaPre =
                  await SharedPreferences.getInstance();
              shaPre.remove("get_id");
              if (!mounted) return;
              Navigator.pushReplacementNamed(context, '/login1');
            },
            icon: const Icon(Icons.logout_rounded),
          ),
        ],
      ),
      drawer: const SafeArea(
        child: Drawer(
          child: Column(
            children: [
              ListTile(
                title: Text('Donate money'),
              ),
              ListTile(
                title: Text('Book date for food donation'),
              ),
              ListTile(
                title: Text('Cancel food bookings'),
              ),
              ListTile(
                title: Text('Register events'),
              ),
              ListTile(
                title: Text('Cancel registration for events'),
              ),
              ListTile(
                title: Text('Add items to cart'),
              ),
              ListTile(
                title: Text('Remove items from cart'),
              ),
              ListTile(
                title: Text('Buy craft products'),
              ),
              ListTile(
                title: Text('Cancel order of craft products'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}