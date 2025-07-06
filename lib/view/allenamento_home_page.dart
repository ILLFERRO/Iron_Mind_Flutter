import 'package:flutter/material.dart';
import 'schede_personalizzate_page.dart';

class AllenamentoHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Allenamento')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => SchedePersonalizzatePage()),
            );
          },
          child: const Text('Crea Scheda'),
        ),
      ),
    );
  }
}