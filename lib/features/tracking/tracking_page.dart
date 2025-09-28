import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:geolocator/geolocator.dart';

class TrackingPage extends StatefulWidget {
  const TrackingPage({super.key});

  @override
  State<TrackingPage> createState() => _TrackingPageState();
}

class _TrackingPageState extends State<TrackingPage> {
  String _status = "대기 중...";
  Position? _position;

  void _scanBluetooth() async {
    setState(() => _status = "블루투스 스캔 시작...");
    FlutterBluePlus.startScan(timeout: const Duration(seconds: 4));

    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult r in results) {
        if (r.device.name.isNotEmpty) {
          setState(() => _status = "발견: ${r.device.name} (RSSI: ${r.rssi})");
        }
      }
    });
  }

  void _getLocation() async {
    _position = await Geolocator.getCurrentPosition();
    setState(() => _status = "GPS 위치: ${_position!.latitude}, ${_position!.longitude}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tracking")),
      body: Center(child: Text(_status)),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(onPressed: _scanBluetooth, child: const Icon(Icons.bluetooth)),
          const SizedBox(height: 10),
          FloatingActionButton(onPressed: _getLocation, child: const Icon(Icons.location_on)),
        ],
      ),
    );
  }
}
