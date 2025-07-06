import '../models/scheda.dart';
import '../models/esercizio.dart';

class SchedaViewModel {
  List<Scheda> getSchede() {
    return [
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
    ];
  }
}