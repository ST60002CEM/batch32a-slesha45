import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to Estate Ease !',
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
