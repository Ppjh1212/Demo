import 'package:demo/layout/default_layout.dart';
import 'package:demo/section8/riverpod/riverpod/provider.dart';
import 'package:demo/section8/riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProviderScreen extends ConsumerWidget {
  const ProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(filteredShoppingListProvider);
    return DefaultLayout(
      title: 'ProviderScreen',
      actions: [
        PopupMenuButton<FilterState>(
          itemBuilder: (context) => FilterState.values
              .map(
                (e) => PopupMenuItem(
                  value: e,
                  child: Text(e.name),
                ),
              )
              .toList(),
          onSelected: (value) => ref.read(filterProvider.notifier).update(
                (state) => value,
              ),
        ),
      ],
      body: ListView(
        children: state
            .map(
              (e) => CheckboxListTile(
                title: Text(e.name.toString()),
                value: e.hasBought,
                onChanged: (value) {
                  ref
                      .read(shoppingListProvier.notifier)
                      .toggleHasBought(name: e.name);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
