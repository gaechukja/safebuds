import 'package:flutter/material.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Find")),
      body: const Center(child: Text("양방향 찾기 기능 (추가 구현 예정)")),
    );
  }
}
