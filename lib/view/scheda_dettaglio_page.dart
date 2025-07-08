import 'package:flutter/material.dart';
import '../models/scheda.dart';
import 'allenamento_page.dart';

class SchedaDettaglioPage extends StatelessWidget {
  final Scheda scheda;

  const SchedaDettaglioPage({Key? key, required this.scheda}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(scheda.nome)),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: scheda.esercizi.length,
              itemBuilder: (context, index) {
                final esercizio = scheda.esercizi[index];
                return ListTile(
                  title: Text(esercizio.nome),
                  subtitle: Text('Ripetizioni: ${esercizio.ripetizioni} | Peso: ${esercizio.peso} kg'),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AllenamentoPage(esercizi: scheda.esercizi),
                  ),
                );
              },
              child: Text("Inizia Allenamento"),
            ),
          ),
        ],
      ),
    );
  }
}