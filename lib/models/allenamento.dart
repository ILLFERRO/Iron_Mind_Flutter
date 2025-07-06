class Allenamento {
  final String esercizio;
  int set;
  int ripetizioni;
  double peso;

  Allenamento({
    required this.esercizio,
    this.set = 1,
    this.ripetizioni = 10,
    this.peso = 20.0,
  });
}