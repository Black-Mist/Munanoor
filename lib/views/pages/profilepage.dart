import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('assets/profile.jpg'),
          const SizedBox(
            height: 20,
          ),
          const Text(
              'iahfshg sg iihg oh aifdifjahaf ia uhi afdhjiakdfjh adikjhf afdhbhfbfdjb kfjbh jdfhgbkjlhla; halkh a; hagh aghahbk'),
        ],
      ),
    );
  }
}
