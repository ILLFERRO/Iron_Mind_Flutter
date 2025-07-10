import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/scheda.dart';
import 'scheda_dettaglio_page.dart';
import 'seleziona_esercizi_page.dart';
import '../viewmodels/scheda_personalizzata_viewmodel.dart';

class SchedePersonalizzatePage extends StatefulWidget {
  @override
  _SchedePersonalizzatePageState createState() => _SchedePersonalizzatePageState();
}

class _SchedePersonalizzatePageState extends State<SchedePersonalizzatePage> {
  List<Scheda> schede = [];

  @override
  void initState() {
    super.initState();
    _caricaSchede();
  }

  Future<void> _caricaSchede() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList('schede_personalizzate') ?? [];
    setState(() => schede = list.map((s) => Scheda.fromJson(json.decode(s))).toList());
  }

  Future<void> _salvaScheda(Scheda s) async {
    final vm = SchedaPersonalizzataViewModel();
    await vm.salvaScheda(s);
    await _caricaSchede();
  }

  Future<void> _rimuoviScheda(int index) async {
    await SchedaPersonalizzataViewModel().rimuoviScheda(index);
    await _caricaSchede();
  }

  Future<void> _nuovaScheda() async {
    final nomeCtrl = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nome scheda'),
        content: TextField(controller: nomeCtrl, decoration: const InputDecoration(hintText: 'Petto & Tricipiti')),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annulla')),
          ElevatedButton(onPressed: () => Navigator.pop(context, true), child: const Text('Avanti')),
        ],
      ),
    );

    if (ok == true && nomeCtrl.text.trim().isNotEmpty) {
      final nuovaScheda = await Navigator.push<Scheda>(
        context,
        MaterialPageRoute(
          builder: (_) => SelezionaEserciziPage(nomeScheda: nomeCtrl.text.trim()),
        ),
      );
      if (nuovaScheda != null) _salvaScheda(nuovaScheda);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Le mie schede')),
      body: schede.isEmpty
          ? const Center(child: Text('Nessuna scheda salvata.'))
          : ListView.builder(
        itemCount: schede.length,
        itemBuilder: (_, i) {
          final scheda = schede[i];
          return Dismissible(
            key: ValueKey(scheda.nome + i.toString()),
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 20),
              child: const Icon(Icons.delete, color: Colors.white),
            ),
            confirmDismiss: (_) async {
              return await showDialog<bool>(
                context: context,
                builder: (_) => AlertDialog(
                  title: const Text('Elimina scheda?'),
                  content: Text('Vuoi eliminare «${scheda.nome}» ?'),
                  actions: [
                    TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annulla')),
                    TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Elimina')),
                  ],
                ),
              );
            },
            onDismissed: (_) => _rimuoviScheda(i),
            child: ListTile(
              title: Text(scheda.nome),
              subtitle: Text('${scheda.esercizi.length} esercizi'),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => SchedaDettaglioPage(scheda: scheda)),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () async {
                  final conferma = await showDialog<bool>(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Elimina scheda?'),
                      content: Text('Vuoi eliminare «${scheda.nome}» ?'),
                      actions: [
                        TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Annulla')),
                        TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Elimina')),
                      ],
                    ),
                  );
                  if (conferma == true) {
                    await _rimuoviScheda(i);
                  }
                },
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _nuovaScheda,
        child: const Icon(Icons.add),
      ),
    );
  }
}