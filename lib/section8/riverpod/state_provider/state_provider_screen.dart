import 'package:demo/layout/default_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final numberProvider = StateProvider(
  (ref) => 0,
);

class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'StateProviderScreen',
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(state.toString()),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update(
                      (state) => state + 1,
                    );
              },
              child: Text('UP'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(numberProvider.notifier).update(
                      (state) => state - 1,
                    );
              },
              child: Text('DOWN'),
            ),
            
          ],
        ),
      ),
    );
  }
}
