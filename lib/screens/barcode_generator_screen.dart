import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';

class BarcodeGeneratorScreen extends StatelessWidget {
  final TextEditingController controller;

  BarcodeGeneratorScreen({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller,
          decoration: InputDecoration(labelText: '바코드 내용 입력'),
        ),
        SizedBox(height: 20),
        WriterWidget(
          data: controller.text,
          onSuccess: (result, bytes) {
            print('바코드 생성 성공');
          },
        ),
      ],
    );
  }
}
