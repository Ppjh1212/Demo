import 'package:demo/riverpod/future_provider/future_provider_screen.dart';
import 'package:demo/riverpod/state_notifier_provider/state_notifier_provider_screen.dart';
import 'package:demo/riverpod/state_provider/state_provider_screen.dart';
import 'package:demo/riverpod/stream_provider/stream_provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        home: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateProviderScreen(),
                  ),
                );
              },
              child: Text('StateProviderScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StateNotifierProviderScreen(),
                  ),
                );
              },
              child: Text('StateNotifierProviderScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FutureProviderScreen(),
                  ),
                );
              },
              child: Text('FutureProviderScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => StreamProviderScreen(),
                  ),
                );
              },
              child: Text('StreamProviderScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
