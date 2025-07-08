class Esercizio {
  String nome;
  double peso;
  int ripetizioni;

  Esercizio({required this.nome, this.peso = 0.0, this.ripetizioni = 0});

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'peso': peso,
    'ripetizioni': ripetizioni,
  };

  factory Esercizio.fromJson(Map<String, dynamic> json) => Esercizio(
    nome: json['nome'],
    peso: json['peso'],
    ripetizioni: json['ripetizioni'],
  );
}