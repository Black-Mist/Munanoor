import 'package:flutter/material.dart';

import 'profilepage.dart';

class AnimationPage extends StatefulWidget {
  const AnimationPage({Key? key}) : super(key: key);

  @override
  State<AnimationPage> createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage> {
  Color widgetColor = Colors.blue;
  Color iconColor = Colors.grey;
  double widgetRadius = 0;
  double widgetOpacity = 0;
  double widgetWidth = 60;
  int count = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ProfilePage()));
              },
              child: const Hero(
                tag: 'profile-image',
                child: CircleAvatar(
                  radius: 42,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile.jpg'),
                  ),
                ),
              ),
            ),
            InkWell(
              radius: widgetRadius,
              onTapCancel: () => setState(() {
                widgetWidth = widgetWidth + 30;
              }),
              onLongPress: () => setState(() {
                widgetWidth = widgetWidth - 10;
                if (widgetWidth >= 220) {
                  widgetOpacity = 1;
                }
              }),
              onTap: () => setState(() {
                if (count == 0) {
                  widgetWidth = 60;
                  widgetOpacity = 0;
                  widgetRadius = 0;
                  widgetColor = Colors.blue;
                  count++;
                } else if (count == 1) {
                  widgetColor = Colors.blue;
                  widgetRadius = 30;
                  count++;
                } else if (count == 2) {
                  widgetWidth = 220;
                  widgetOpacity = 1;
                  count++;
                } else if (count == 3) {
                  widgetWidth = 60;
                  widgetOpacity = 0;
                  count = 0;
                }
              }),
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: 1),
                duration: const Duration(seconds: 10),
                builder: (context, double value, child) => AnimatedRotation(
                  turns: value,
                  duration: const Duration(milliseconds: 0),
                  child: child,
                ),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: 60,
                  width: widgetWidth,
                  decoration: BoxDecoration(
                      color: widgetColor,
                      borderRadius: BorderRadius.circular(widgetRadius)),
                  child: AnimatedOpacity(
                    duration: const Duration(microseconds: 300),
                    opacity: widgetOpacity,
                    child: const Center(
                        child: Text(
                      'Sign In',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
