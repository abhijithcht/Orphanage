import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({super.key});

  @override
  State<HomeAdmin> createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  // int _currentIndex = 0;
  // final List _pages = [];
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
              Navigator.pushReplacementNamed(context, '/login2');
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
                title: Text('Add Events'),
              ),
              ListTile(
                title: Text('Delete Events'),
              ),
              ListTile(
                title: Text('Edit Events'),
              ),
              ListTile(
                title: Text('Cancel food bookings'),
              ),
              ListTile(
                title: Text('Add item to the craft shop'),
              ),
              ListTile(
                title: Text('Edit craft shop item'),
              ),
              ListTile(
                title: Text('Remove craft shop item'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}