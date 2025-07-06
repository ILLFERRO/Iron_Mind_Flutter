// lib/models/scheda.dart
import 'esercizio.dart';

class Scheda {
  final String nome;
  final List<Esercizio> esercizi;

  Scheda({required this.nome, required this.esercizi});

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'esercizi': esercizi.map((e) => e.toJson()).toList(),
  };

  factory Scheda.fromJson(Map<String, dynamic> json) => Scheda(
    nome: json['nome'],
    esercizi: (json['esercizi'] as List)
        .map((e) => Esercizio.fromJson(Map<String, dynamic>.from(e)))
        .toList(),
  );
}