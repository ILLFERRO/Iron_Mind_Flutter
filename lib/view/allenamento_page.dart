import 'package:flutter/material.dart';
import '../models/esercizio.dart';

class AllenamentoPage extends StatefulWidget {
  final List<Esercizio> esercizi;

  const AllenamentoPage({Key? key, required this.esercizi}) : super(key: key);

  @override
  _AllenamentoPageState createState() => _AllenamentoPageState();
}

class _AllenamentoPageState extends State<AllenamentoPage> {
  int currentIndex = 0;

  void incrementPeso() {
    setState(() {
      widget.esercizi[currentIndex].peso += 2.5;
    });
  }

  void decrementPeso() {
    setState(() {
      widget.esercizi[currentIndex].peso = (widget.esercizi[currentIndex].peso - 2.5).clamp(0.0, double.infinity);
    });
  }

  void incrementRipetizioni() {
    setState(() {
      widget.esercizi[currentIndex].ripetizioni++;
    });
  }

  void decrementRipetizioni() {
    setState(() {
      widget.esercizi[currentIndex].ripetizioni = (widget.esercizi[currentIndex].ripetizioni - 1).clamp(0, 99);
    });
  }

  void prossimoEsercizio() {
    if (currentIndex < widget.esercizi.length - 1) {
      setState(() {
        currentIndex++;
      });
    } else {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text("Allenamento completato!"),
          content: Text("Hai completato tutti gli esercizi."),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: Text("OK"),
            )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final esercizio = widget.esercizi[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Allenamento")),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Text(esercizio.nome, style: Theme.of(context).textTheme.titleLarge),
            SizedBox(height: 16),
            Text("Peso: ${esercizio.peso} kg"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: decrementPeso, icon: Icon(Icons.remove)),
                IconButton(onPressed: incrementPeso, icon: Icon(Icons.add)),
              ],
            ),
            SizedBox(height: 16),
            Text("Ripetizioni: ${esercizio.ripetizioni}"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(onPressed: decrementRipetizioni, icon: Icon(Icons.remove)),
                IconButton(onPressed: incrementRipetizioni, icon: Icon(Icons.add)),
              ],
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: prossimoEsercizio,
              child: Text("Prossimo Esercizio"),
            ),
          ],
        ),
      ),
    );
  }
}