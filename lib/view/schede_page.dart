import 'package:flutter/material.dart';
import 'package:ironmind_flutter/view/scheda_dettaglio_page.dart';
import '../models/scheda.dart';
import '../models/esercizio.dart';

class SchedePage extends StatelessWidget {
  final List<Scheda> schede = [
    Scheda(
      nome: "Principiante",
      esercizi: [
        Esercizio(nome: 'Body-Weight Squat', ripetizioni: 12, peso: 0.0),
        Esercizio(nome: 'Push-Ups (Knee)', ripetizioni: 10, peso: 0.0),
      ],
    ),
    Scheda(
      nome: "Intermedio",
      esercizi: [
        Esercizio(nome: 'Chest Press', ripetizioni: 10, peso: 30.0),
        Esercizio(nome: 'Lat Machine', ripetizioni: 10, peso: 35.0),
      ],
    ),
    Scheda(
      nome: "Esperto",
      esercizi: [
        Esercizio(nome: 'Barbell Squat', ripetizioni: 8, peso: 60.0),
        Esercizio(nome: 'Deadlift', ripetizioni: 6, peso: 80.0),
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