import 'package:flutter/material.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  // Card items holder
  Widget homeCard({required String image, required String text}) => Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black12),
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 70,
              height: 70,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        homeCard(image: 'assets/pic_1.png', text: 'Termite \n Treatment'),
        homeCard(image: 'assets/pic_2.png', text: 'Disinfestation'),
        homeCard(image: 'assets/pic_3.png', text: 'Rodent \n Control'),
        homeCard(image: 'assets/pic_4.png', text: 'Bird \n Control'),
        homeCard(image: 'assets/pic_5.png', text: 'Bed Bug \n Treatment'),
        homeCard(
            image: 'assets/pic_6.png', text: 'Snake & Scorpion \n Control'),
      ],
    );
  }
}
