// lib/view/qr_page.dart
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String qrData = "Alessandro Ferranti | IronMind";

    return Scaffold(
      appBar: AppBar(title: const Text("QR-Code Palestra")),
      body: Center(
        child: QrImageView(
          data: qrData,
          version: QrVersions.auto,
          size: 200.0,
        ),
      ),
    );
  }
}