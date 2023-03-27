import 'package:flutter/material.dart';

Widget latestNotification(BuildContext context) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Latest notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 25),
          child: ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 5,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Colors.black12,
                thickness: 0.2,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: CircleAvatar(
                      backgroundColor: Colors.black12,
                      radius: 25.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 24.0,
                        child: Image.asset(
                          'assets/logo_small.png',
                          color: const Color.fromARGB(255, 11, 212, 212),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const [
                          Text(
                            'data',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            'data',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 11, 212, 212),
                                fontFamily: 'Poppins'),
                          ),
                          Text(
                            'data',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins'),
                          ),
                        ],
                      ),
                      const Text(
                        'data',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            color: Colors.grey,
                            fontFamily: 'Poppins'),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ],
    );
