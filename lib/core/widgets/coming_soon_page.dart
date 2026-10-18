import 'package:flutter/material.dart';

/// Pantalla temporal para módulos que aún no se implementan.
class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Text(
            'Este módulo se implementará en una siguiente etapa.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
