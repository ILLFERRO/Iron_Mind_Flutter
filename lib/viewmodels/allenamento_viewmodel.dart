import '../models/allenamento.dart';

class AllenamentoViewModel {
  final Allenamento _allenamento = Allenamento(esercizio: "Chest Press");

  Allenamento get allenamento => _allenamento;

  void aggiungiSet() {
    _allenamento.set++;
  }
}