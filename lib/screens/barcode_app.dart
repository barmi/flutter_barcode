import 'package:flutter/material.dart';
import 'package:flutter_zxing/flutter_zxing.dart';

class BarcodeApp extends StatefulWidget {
  @override
  _BarcodeAppState createState() => _BarcodeAppState();
}

class _BarcodeAppState extends State<BarcodeApp> {
  final TextEditingController _controller = TextEditingController();
  String _scannedResult = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('바코드 스캐너 & 생성기')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // 바코드 스캐너
              Container(
                height: 300,
                child: ReaderWidget(
                  onScan: (result) {
                    setState(() {
                      _scannedResult = result.text ?? '스캔 실패';
                    });
                  },
                ),
              ),
              Text('스캔 결과: $_scannedResult'),
              SizedBox(height: 20),
              // 바코드 생성기
              TextField(
                controller: _controller,
                decoration: InputDecoration(labelText: '바코드 내용 입력'),
              ),
              SizedBox(height: 20),
              WriterWidget(
                data: _controller.text,
                onSuccess: (result, bytes) {
                  print('바코드 생성 성공');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
