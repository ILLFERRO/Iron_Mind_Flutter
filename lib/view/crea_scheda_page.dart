// lib/view/crea_scheda_page.dart
import 'package:flutter/material.dart';
import '../models/scheda.dart';
import '../models/esercizio.dart';

class CreaSchedaPage extends StatefulWidget {
  @override
  _CreaSchedaPageState createState() => _CreaSchedaPageState();
}

class _CreaSchedaPageState extends State<CreaSchedaPage> {
  final TextEditingController nomeController = TextEditingController();
  List<Esercizio> esercizi = [];

  void aggiungiEsercizio() {
    setState(() {
      esercizi.add(Esercizio(nome: "Nuovo esercizio", peso: 0.0, ripetizioni: 0));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Crea nuova scheda")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: "Nome scheda"),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: esercizi.length,
                itemBuilder: (context, index) {
                  final esercizio = esercizi[index];
                  return ListTile(
                    title: TextField(
                      decoration: InputDecoration(labelText: "Nome esercizio"),
                      onChanged: (val) => esercizio.nome = val,
                    ),
                    subtitle: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(labelText: "Peso"),
                            keyboardType: TextInputType.number,
                            onChanged: (val) => esercizio.peso = double.tryParse(val) ?? 0,
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(labelText: "Ripetizioni"),
                            keyboardType: TextInputType.number,
                            onChanged: (val) => esercizio.ripetizioni = int.tryParse(val) ?? 0,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                final nuovaScheda = Scheda(nome: nomeController.text, esercizi: esercizi);
                Navigator.pop(context, nuovaScheda);
              },
              child: Text("Salva scheda"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: aggiungiEsercizio,
        child: Icon(Icons.add),
      ),
    );
  }
}