import 'package:flutter/material.dart';

import '../widgets/all_not.dart';
import '../widgets/latest_not.dart';
import '../widgets/tabbar.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              tabBar(context, title: 'NOTIFICATION'),
              latestNotification(context),
              allNotification(context)
            ],
          ),
        ),
      ),
    );
  }
}
