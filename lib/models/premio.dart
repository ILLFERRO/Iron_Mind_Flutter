class Premio {
  final String nome;
  final String descrizione;
  final bool sbloccato;

  Premio({
    required this.nome,
    required this.descrizione,
    required this.sbloccato,
  });

  Map<String, dynamic> toJson() => {
    'nome': nome,
    'descrizione': descrizione,
    'sbloccato': sbloccato,
  };

  factory Premio.fromJson(Map<String, dynamic> json) => Premio(
    nome: json['nome'],
    descrizione: json['descrizione'],
    sbloccato: json['sbloccato'],
  );
}