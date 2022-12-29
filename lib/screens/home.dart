import 'package:flutter/material.dart';
import 'package:notify/services/locao_notifications_service.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late final LocalNotificationService service;
  @override
  void initState() {
    service = LocalNotificationService();
    service.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Notifications Demo'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Center(
            child: SizedBox(
              height: 300,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    'This is a demo of how to use a local notifications in Flutter',
                    style: TextStyle(fontSize: 20),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showNotification(
                          id: 0,
                          title: 'notification',
                          body: 'notification teste');
                    },
                    child: const Text('show local notification'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await service.showScheduleNotification(
                          id: 2,
                          title: 'notification schedule',
                          body: 'body notification schedule',
                          seconds: 5);
                    },
                    child: const Text('show Schedule notification'),
                  ),
                  ElevatedButton(
                    onPressed: () async {},
                    child: const Text('show Notification with payload'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
