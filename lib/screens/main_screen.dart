import 'package:flutter/material.dart';
import 'package:hangangtemperature/services/api_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Future test = ApiService.getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.1),
        title: const Text(
          'Test',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Yeongdeok-Blueroad',
          ),
        ),
      ),
      body: FutureBuilder(
        future: test,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data);
          }
          return const Text('Loading');
        },
      ),
    );
  }
}
