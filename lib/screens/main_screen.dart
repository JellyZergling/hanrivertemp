import 'package:flutter/material.dart';
import 'package:hangangtemperature/services/api_service.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ApiService().getTodaysData();
    return const Scaffold(
      body: Text('test'),
    );
  }
}
