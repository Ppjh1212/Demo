import 'package:demo/layout/default_layout.dart';
import 'package:demo/section9/riverpod/code_generation_screen.dart';
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
    return DefaultLayout(
      title: 'Section9',
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
                    builder: (context) => CodeGenerationScreen(),
                  ),
                );
              },
              child: Text('CodeGenerationScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
