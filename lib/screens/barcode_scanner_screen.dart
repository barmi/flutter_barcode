import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';

class BarcodeScannerScreen extends StatelessWidget {
  final Function(String) onScan;

  BarcodeScannerScreen({required this.onScan});

  @override
  Widget build(BuildContext context) {
    return ReaderWidget(
      onScan: (result) {
        if (result.isValid) {
          onScan(result.text ?? '스캔 실패');
        }
      },
    );
  }
}
