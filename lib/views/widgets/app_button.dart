import 'package:flutter/material.dart';

Widget defaulButton({required String text, required VoidCallback onTap}) =>
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 11, 212, 212),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );

Widget signupButton({required String text, required VoidCallback onTap}) =>
    Padding(
      padding: const EdgeInsets.only(top: 15),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: double.infinity,
          height: 55,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 8, 67, 160),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Text(
              text.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
