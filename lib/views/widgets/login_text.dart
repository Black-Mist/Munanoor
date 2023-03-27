import 'package:flutter/material.dart';

Widget loginText(
        {required String question,
        required String solution,
        required VoidCallback onTap}) =>
    Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(question),
          InkWell(
            onTap: onTap,
            child: Text(
              solution,
              style: const TextStyle(
                  color: Color.fromARGB(255, 11, 212, 212),
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
