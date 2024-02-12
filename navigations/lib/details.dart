import 'package:flutter/material.dart';
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
        backgroundColor: Colors.pink,
      ),
      body: Center(child: Text("Burası Ayarlar Sayfası")),
    );
  }
}