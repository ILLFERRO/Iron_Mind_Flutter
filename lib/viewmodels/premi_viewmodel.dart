import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/premio.dart';

class PremiViewModel {
  final String _key = "premi";

  Future<List<Premio>> caricaPremi() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_key);
    if (jsonString == null) {
      final defaultPremi = [
        Premio(nome: "Costanza", descrizione: "Allenamenti per 1 settimana", sbloccato: true),
        Premio(nome: "Resilienza", descrizione: "10 allenamenti", sbloccato: false),
      ];
      salvaPremi(defaultPremi);
      return defaultPremi;
    }
    final List decoded = json.decode(jsonString);
    return decoded.map((item) => Premio.fromJson(item)).toList();
  }

  Future<void> salvaPremi(List<Premio> premi) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = json.encode(premi.map((p) => p.toJson()).toList());
    await prefs.setString(_key, jsonString);
  }
}