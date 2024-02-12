import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings Page"),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('This is the second screen'),
            ElevatedButton(
              onPressed: () {
                // Navigate back to the first screen when the button is pressed
                Navigator.pop(context);
              },
              child: Text('Go Back to First Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
