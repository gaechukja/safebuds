import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class AlertsPage extends StatefulWidget {
  const AlertsPage({super.key});

  @override
  State<AlertsPage> createState() => _AlertsPageState();
}

class _AlertsPageState extends State<AlertsPage> {
  final FlutterLocalNotificationsPlugin _notifications = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    const AndroidInitializationSettings androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings = InitializationSettings(android: androidSettings);
    _notifications.initialize(initSettings);
  }

  Future<void> _sendAlert() async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails("alerts", "Alerts",
            importance: Importance.max, priority: Priority.high);
    const NotificationDetails details = NotificationDetails(android: androidDetails);

    await _notifications.show(0, "SafeBuds 경고", "이어폰과 멀어지고 있습니다!", details);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Alerts")),
      body: Center(child: ElevatedButton(onPressed: _sendAlert, child: const Text("테스트 알림"))),
    );
  }
}
