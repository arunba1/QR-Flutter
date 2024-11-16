import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class GenerateQRScreen extends StatefulWidget {
  const GenerateQRScreen({super.key});

  @override
  State<GenerateQRScreen> createState() => _GenerateQRScreenState();
}

class _GenerateQRScreenState extends State<GenerateQRScreen> {
  String? qrData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Generate QR Code"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, "/scan");
              },
              icon: const Icon(Icons.qr_code_scanner))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    qrData = value;
                  });
                },
              ),
              SizedBox(
                height: 60,
              ),
              if (qrData != null) PrettyQrView.data(data: qrData!),
            ],
          ),
        ),
      ),
    );
  }
}
