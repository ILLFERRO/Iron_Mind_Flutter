import 'package:flutter/material.dart';
import '../models/esercizio.dart';
import 'compila_scheda_page.dart';

class SelezionaEserciziPage extends StatefulWidget {
  final String nomeScheda;
  const SelezionaEserciziPage({super.key, required this.nomeScheda});

  @override
  State<SelezionaEserciziPage> createState() => _SelezionaEserciziPageState();
}

class _SelezionaEserciziPageState extends State<SelezionaEserciziPage> {
  final List<Esercizio> disponibili = [
    Esercizio(nome: 'Chest Press', peso: 30, ripetizioni: 10),
    Esercizio(nome: 'Lat Machine', peso: 35, ripetizioni: 10),
    Esercizio(nome: 'Squat', peso: 40, ripetizioni: 12),
    Esercizio(nome: 'Curl Manubri', peso: 15, ripetizioni: 12),
  ];
  final List<Esercizio> selezionati = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Seleziona Esercizi')),
      body: ListView.builder(
        itemCount: disponibili.length,
        itemBuilder: (_, i) {
          final esercizio = disponibili[i];
          final inLista = selezionati.contains(esercizio);
          return ListTile(
            title: Text(esercizio.nome),
            trailing: IconButton(
              icon: Icon(inLista ? Icons.remove : Icons.add),
              onPressed: () {
                setState(() {
                  inLista ? selezionati.remove(esercizio) : selezionati.add(esercizio);
                });
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: selezionati.isEmpty
            ? null
            : () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => CompilaSchedaPage(
                nomeScheda: widget.nomeScheda,
                esercizi: List<Esercizio>.from(selezionati),
              ),
            ),
          );
        },
        label: const Text('Compila Scheda'),
        icon: const Icon(Icons.done),
      ),
    );
  }
}