import 'package:flutter/material.dart';
import 'package:path/path.dart';

import '../config/colors.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: primary,
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kelompok 2',
              style: TextStyle(fontSize: 16.0, color: primary),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Abid Bilal, NIM : 123200069 \nWayan Danu, NIM : 123200025',
              style: TextStyle(
                  fontSize: 20.0, fontWeight: FontWeight.bold, color: primary),
            ),
            const SizedBox(height: 8.0),
          ],
        ),
      ),
    );
  }
}
