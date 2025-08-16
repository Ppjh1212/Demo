import 'package:flutter/material.dart';

class DefaultLayout extends StatelessWidget {
  DefaultLayout({
    super.key,
    required this.title,
    required this.body,
    this.actions,
  });
  final String title;
  final Widget body;
  List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
        actions: actions,
      ),
      body: body,
    );
  }
}
