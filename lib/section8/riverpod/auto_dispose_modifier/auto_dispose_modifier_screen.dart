import 'package:demo/layout/default_layout.dart';
import 'package:demo/section8/riverpod/riverpod/auto_dispose_modifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(autoDisposeModifierProvider);
    return DefaultLayout(title: 'AutoDisposeModifierScreen', body: Center(
        child: state.when(
          data: (data) => Text(data.toString()),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => CircularProgressIndicator(),
        ),
      ),
    );
  }
}
