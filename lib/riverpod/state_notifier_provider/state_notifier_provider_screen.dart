import 'package:demo/riverpod/model/shopping_item_model.dart';
import 'package:demo/riverpod/riverpod/state_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StateNotifierProviderScreen extends ConsumerWidget {
  const StateNotifierProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<ShoppingItemModel> state = ref.watch(shoppingListProvier);
    return Scaffold(
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
