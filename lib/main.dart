import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/tracking/tracking_page.dart';
import 'features/alerts/alerts_page.dart';
import 'features/find/find_page.dart';
import 'features/battery/battery_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const SafeBudsApp());
}

class SafeBudsApp extends StatelessWidget {
  const SafeBudsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SafeBuds',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  final List<Widget> _pages = const [
    TrackingPage(),
    AlertsPage(),
    FindPage(),
    BatteryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.location_on), label: "Tracking"),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Find"),
          BottomNavigationBarItem(icon: Icon(Icons.battery_charging_full), label: "Battery"),
        ],
      ),
    );
  }
}
