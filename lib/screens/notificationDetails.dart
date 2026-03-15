import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class NotificationDetails extends StatelessWidget {
  final String title;
  final String body;
  const NotificationDetails({super.key,required this.title,required this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Text(body),
          ],
        ),
      ),
    );
  }
}
