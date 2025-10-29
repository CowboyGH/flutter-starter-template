import 'package:flutter/material.dart';

/// The main application widget.
class FlutterStarterTemplate extends StatelessWidget {
  /// Creates a [FlutterStarterTemplate] widget.
  const FlutterStarterTemplate({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Flutter Starter Template'),
        ),
      ),
    );
  }
}
