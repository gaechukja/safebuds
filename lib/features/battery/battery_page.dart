import 'package:flutter/material.dart';

class BatteryPage extends StatelessWidget {
  const BatteryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Battery")),
      body: const Center(
          child: Text("AI 기반 배터리 최적화 모듈 (MVP 단계에서는 단순 Placeholder)")),
    );
  }
}
