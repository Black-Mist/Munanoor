import 'package:flutter/material.dart';
import 'package:training/views/widgets/tabbar.dart';

import '../widgets/app_expansiontile.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({Key? key}) : super(key: key);

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final ScrollController _controller = ScrollController();

  final List descriptions = [
    {
      "title": "Sharun das  placed an order",
      "description":
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.'
    },
    {
      "title": "Where can I get some?",
      "description":
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.'
    },
    {
      "title": "Where does it come from?",
      "description":
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.'
    },
    {
      "title": "Why do we use it?",
      "description":
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.'
    },
    {
      "title": "What is Lorem Ipsum?",
      "description":
          'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.'
    },
  ];

  Widget _buildExpandableTile(item) => AppExpansionTile(
        title: Text(
          item['title'],
        ),
        children: <Widget>[
          ListTile(
            title: Column(
              children: [
                const Divider(),
                const SizedBox(height: 5),
                Text(
                  item['description'],
                  style: const TextStyle(
                      fontWeight: FontWeight.w200,
                      fontSize: 13,
                      color: Colors.black45),
                ),
              ],
            ),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              tabBar(context, title: 'FAQ'),
              ListView.separated(
                controller: _controller,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: descriptions.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildExpandableTile(descriptions[index]);
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
