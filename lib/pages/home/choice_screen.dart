import 'package:flutter/material.dart';
import 'package:hope_orphanage/widgets/elevated_button.dart';

class ChoiceScreen extends StatefulWidget {
  const ChoiceScreen({super.key});

  @override
  State<ChoiceScreen> createState() => _ChoiceScreenState();
}

class _ChoiceScreenState extends State<ChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HOPE ORPHANAGE'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ELB(
            text: 'USER',
            onPressed: () {
              Navigator.pushNamed(context, '/splash1');
            },
          ),
          const SizedBox(
            height: 12,
          ),
          ELB(
            text: 'ADMIN',
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/splash2',
              );
            },
          ),
        ],
      ),
    );
  }
}