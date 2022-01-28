import 'dart:io';

import 'package:bmi_app/pages/bmi_main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageResult extends StatefulWidget {
  const PageResult({
    Key? key,
    this.BMI,
  }) : super(key: key);

  final String? BMI;

  @override
  _PageResultState createState() => _PageResultState();
}

String resultE = '';

class _PageResultState extends State<PageResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI Result'),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
              child: Text(
                'Your BMI is ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              resultE,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 60, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
              child: Text(
                'คะแนนของคุณอยู่ในระดับ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              BMI,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 60, color: Colors.blue),
            ),
            // ElevatedButton(onPressed: () {}, child: Text('data')),
          ],
        ),
      ),
    );
  }
}
