class QRData {
  final String nome;
  final String cognome;

  QRData({required this.nome, required this.cognome});

  String get contenuto => "$nome $cognome | IronMind";
}