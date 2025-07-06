import 'package:flutter/material.dart';
import 'allenamento_home_page.dart';     // ⬅️  nuovo import

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Iron Mind')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/schede'),
              child: const Text('Schede Allenamento'),
            ),
            // 🔹 nuovo flusso Allenamento (schede personalizzate)
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => AllenamentoHomePage()),
                );
              },
              child: const Text('Allenamento'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/premi'),
              child: const Text('Premi e Badge'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/qr'),
              child: const Text('QR-Code Palestra'),
            ),
          ],
        ),
      ),
    );
  }
}