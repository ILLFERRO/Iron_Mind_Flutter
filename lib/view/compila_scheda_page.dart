import 'package:flutter/material.dart';
import '../models/esercizio.dart';
import '../models/scheda.dart';
import 'allenamento_page.dart';
import '../viewmodels/scheda_personalizzata_viewmodel.dart';

class CompilaSchedaPage extends StatelessWidget {
  final String nomeScheda;
  final List<Esercizio> esercizi;

  const CompilaSchedaPage({
    super.key,
    required this.nomeScheda,
    required this.esercizi,
  });

  @override
  Widget build(BuildContext context) {
    final scheda = Scheda(nome: nomeScheda, esercizi: esercizi);

    return Scaffold(
      appBar: AppBar(title: const Text('Anteprima Scheda')),
      body: ListView(
        children: [
          ListTile(
            title: Text('Nome: $nomeScheda'),
            subtitle: Text('${esercizi.length} esercizi'),
          ),
          const Divider(),
          ...esercizi.map(
                (e) => ListTile(
              title: Text(e.nome),
              subtitle: Text('Rip: ${e.ripetizioni} | Peso: ${e.peso} kg'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton(
          onPressed: () async {
            // 🔒 salva in SharedPreferences
            await SchedaPersonalizzataViewModel().salvaScheda(scheda);
            // ▶️ avvia allenamento
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => AllenamentoPage(esercizi: esercizi),
              ),
            );
          },
          child: const Text('Inizia Allenamento'),
        ),
      ),
    );
  }
}