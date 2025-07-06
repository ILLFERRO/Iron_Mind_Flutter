import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/scheda.dart';

class SchedaPersonalizzataViewModel {
  final _key = 'schede_personalizzate';

  Future<List<Scheda>> caricaSchede() async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_key) ?? [];
    return list.map((s) => Scheda.fromJson(json.decode(s))).toList();
  }

  Future<void> salvaScheda(Scheda scheda) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await caricaSchede();
    list.add(scheda);
    await prefs.setStringList(
      _key,
      list.map((s) => json.encode(s.toJson())).toList(),
    );
  }

  Future<void> rimuoviScheda(int index) async {
    final prefs = await SharedPreferences.getInstance();
    final list = await caricaSchede();
    if (index >= 0 && index < list.length) {
      list.removeAt(index);
      await prefs.setStringList(
        _key,
        list.map((s) => json.encode(s.toJson())).toList(),
      );
    }
  }
}