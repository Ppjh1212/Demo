import 'dart:developer';

import 'package:demo/layout/default_layout.dart';
import 'package:demo/section8/riverpod/riverpod/select_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //데이터 렌더링 최소화
    final state = ref.watch(selectProvider.select(
      (value) => value.isSpicy,
    ));

    ref.listen(
      selectProvider.select(
        (value) => value.hasBought,
      ),
      (previous, next) {
        log('$previous, $next');
      },
    );
    return DefaultLayout(
      title: 'SelectProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(state.toString()),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleHasBought();
            },
            child: Text('HasBought Toggle'),
          ),
          ElevatedButton(
            onPressed: () {
              ref.read(selectProvider.notifier).toggleIsSpicy();
            },
            child: Text('Spicy Toggle'),
          ),
        ],
      ),
    );
  }
}
