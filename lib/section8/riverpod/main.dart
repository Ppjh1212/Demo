import 'package:demo/layout/default_layout.dart';
import 'package:demo/section8/riverpod/auto_dispose_modifier/auto_dispose_modifier_screen.dart';
import 'package:demo/section8/riverpod/family_modifier/family_modifier_screen.dart';
import 'package:demo/section8/riverpod/future_provider/future_provider_screen.dart';
import 'package:demo/section8/riverpod/listen_provider/listen_provider_screen.dart';
import 'package:demo/section8/riverpod/provider/provider_screen.dart';
import 'package:demo/section8/riverpod/riverpod/provider_observer.dart';
import 'package:demo/section8/riverpod/select_provider/select_provider_screen.dart';
import 'package:demo/section8/riverpod/state_notifier_provider/state_notifier_provider_screen.dart';
import 'package:demo/section8/riverpod/state_provider/state_provider_screen.dart';
import 'package:demo/section8/riverpod/stream_provider/stream_provider_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Logger(),
      ],
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
      title: 'Section8',
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
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FamilyModifierScreen(),
                  ),
                );
              },
              child: Text('FamilyModifierScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AutoDisposeModifierScreen(),
                  ),
                );
              },
              child: Text('AutoDisposeModifierScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ListenProviderScreen(),
                  ),
                );
              },
              child: Text('ListenProviderScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectProviderScreen(),
                  ),
                );
              },
              child: Text('SelectProviderScreen'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProviderScreen(),
                  ),
                );
              },
              child: Text('ProviderScreen'),
            ),
          ],
        ),
      ),
    );
  }
}
