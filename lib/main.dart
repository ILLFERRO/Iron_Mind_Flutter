import 'package:flutter/material.dart';
import 'view/home_page.dart';
import 'view/schede_page.dart';
import 'view/premi_page.dart';
import 'view/qr_page.dart';
// 👉 non importare più allenamento_page qui; lo aprirai solo quando hai esercizi

void main() => runApp(IronMindApp());

class IronMindApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Iron Mind Flutter',
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const HomePage(),
      routes: {
        '/schede' : (_) => SchedePage(),
        '/premi'  : (_) => PremiPage(),
        '/qr'     : (_) => QRPage(),
        //  🎯  NIENTE '/allenamento' con lista vuota!
        // '/allenamentoHome': (_) => AllenamentoHomePage(), // se vuoi route nominata
      },
    );
  }
}