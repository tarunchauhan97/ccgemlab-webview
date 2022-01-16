import 'package:ccgemlab/web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ccGemLab(),
    ),
  );
}

class ccGemLab extends StatelessWidget {
  const ccGemLab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ccGemLabWeb(),
      ),
    );
  }
}
