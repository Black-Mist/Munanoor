import 'package:flutter/material.dart';

import 'animationpage.dart';
import 'faqpage.dart';
import 'home_page.dart';
import 'login/loginpage.dart';
import 'notification_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final textController = TextEditingController();

  Widget newButton = Container(
    width: 500.0,
    height: 500.0,
    color: const Color(0xff333333),
    alignment: Alignment.center,
    transformAlignment: Alignment.center,
    child: Container(
      color: const Color(0xff333333),
      child: Container(
        width: 193,
        height: 193,
        decoration: BoxDecoration(
          color: const Color(0xff333333),
          borderRadius: BorderRadius.circular(27),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff333333),
              Color(0xff333333),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0xff505050),
              offset: Offset(-20.0, -20.0),
              blurRadius: 39,
              spreadRadius: 0.0,
            ),
            BoxShadow(
              color: Color(0xff161616),
              offset: Offset(20.0, 20.0),
              blurRadius: 39,
              spreadRadius: 0.0,
            ),
          ],
        ),
        child: const Icon(
          Icons.star,
          size: 64,
          color: Colors.amber,
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
                },
                icon: const Icon(Icons.home_outlined),
                label: const Text('Home Page')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()));
                },
                icon: const Icon(Icons.login),
                label: const Text('Login Page')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const NotificationPage()));
                },
                icon: const Icon(Icons.notifications_none_outlined),
                label: const Text('Notification Page')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AnimationPage()));
                },
                icon: const Icon(Icons.android_rounded),
                label: const Text('Animation Page')),
            ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const FAQPage()));
                },
                icon: const Icon(Icons.my_library_books_outlined),
                label: const Text('FAQ Page')),
          ],
        ),
      ),
    );
  }
}
