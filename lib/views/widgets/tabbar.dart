import 'package:flutter/material.dart';

Widget tabBar(BuildContext context, {required String title}) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: (() => Navigator.of(context).pop()),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Icon(
                Icons.arrow_back,
                color: Colors.grey,
              ),
            ),
          ),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins'),
          )
        ],
      ),
    );
