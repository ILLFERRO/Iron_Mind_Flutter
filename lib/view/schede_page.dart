import 'package:flutter/material.dart';
import 'package:ironmind_flutter/view/scheda_dettaglio_page.dart';
import '../models/scheda.dart';
import '../models/esercizio.dart';

class SchedePage extends StatelessWidget {
  final List<Scheda> schede = [
    Scheda(
      nome: "Petto & Tricipiti",
      esercizi: [
        Esercizio(nome: "Chest Press", ripetizioni: 10, peso: 30.0),
        Esercizio(nome: "French Press", ripetizioni: 12, peso: 20.0),
      ],
    ),
    Scheda(
      nome: "Schiena & Bicipiti",
      esercizi: [
        Esercizio(nome: "Lat Machine", ripetizioni: 10, peso: 35.0),
        Esercizio(nome: "Curl Manubri", ripetizioni: 12, peso: 15.0),
      ],
    ),
    Scheda(
      nome: "Gambe",
      esercizi: [
        Esercizio(nome: "Leg Press", ripetizioni: 10, peso: 50.0),
        Esercizio(nome: "Affondi", ripetizioni: 12, peso: 20.0),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Schede Allenamento")),
      body: ListView.builder(
        itemCount: schede.length,
        itemBuilder: (context, index) {
          final scheda = schede[index];
          return ListTile(
            title: Text(scheda.nome),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SchedaDettaglioPage(scheda: scheda),
                ),
              );
            },
          );
        },
      ),
    );
  }
}