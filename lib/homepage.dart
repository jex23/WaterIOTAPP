import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    User? user = _auth.currentUser;

    // Extract the part of the email before '@' and remove numbers
    String emailPrefix = user?.email?.split('@').first.replaceAll(RegExp(r'[0-9]'), '') ?? '';

    // Capitalize the first letter
    String capitalizedPrefix = emailPrefix.isNotEmpty ? emailPrefix[0].toUpperCase() + emailPrefix.substring(1) : '';

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, $capitalizedPrefix'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                await _auth.signOut();
                Navigator.pushReplacementNamed(context, '/signin');
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
