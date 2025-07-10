import 'package:flutter/material.dart';

class PremiPage extends StatelessWidget {
  final premi = [
    {"nome": "Costanza", "sbloccato": true},
    {"nome": "Resilienza", "sbloccato": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Premi e Badge")),
      body: ListView.builder(
        itemCount: premi.length,
        itemBuilder: (context, index) {
          final premio = premi[index];
          return ListTile(
            title: Text(premio['nome'] as String),
            trailing: Icon(
              premio['sbloccato'] as bool ? Icons.emoji_events : Icons.lock,
              color: premio['sbloccato'] as bool ? Colors.amber : Colors.grey,
            ),
          );
        },
      ),
    );
  }
}