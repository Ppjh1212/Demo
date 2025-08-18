import 'package:demo/layout/default_layout.dart';
import 'package:demo/section9/riverpod/riverpod/code_generation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        children: [
          Text('state1: $state1'),
          state2.when(
            data: (data) => Text('state2: $data'),
            error: (error, stack) => Text(error.toString()),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
          state3.when(
            data: (data) => Text('state3: $data'),
            error: (error, stack) => Text(error.toString()),
            loading: () => Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
