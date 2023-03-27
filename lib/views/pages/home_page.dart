import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'homepages/productspage.dart';
import 'homepages/servicepage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController mainTabControler;

  @override
  void initState() {
    mainTabControler = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: const Color.fromARGB(255, 11, 212, 212),
            snap: true,
            pinned: true,
            floating: true,
            expandedHeight: 180,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: const Color.fromARGB(255, 11, 212, 212),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Image.asset('assets/logo_big.png'),
                    ),
                    const Positioned(
                        left: 60,
                        top: 50,
                        child: Text(
                          'Hi, Welcome',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w100),
                        ))
                  ],
                ),
              ),
            ),
            leading: IconButton(
              icon: SvgPicture.asset('assets/menu.svg'),
              tooltip: 'Menu',
              onPressed: () {},
            ),
            bottom: TabBar(
              controller: mainTabControler,
              indicatorColor: Colors.white,
              indicatorWeight: 3.0,
              tabs: const [
                Tab(text: 'Services'),
                Tab(text: 'Products'),
              ],
            ),
          ),
        ],
        body: TabBarView(
          controller: mainTabControler,
          children: const [
            ServicePage(),
            ProductPage(),
          ],
        ),
      ),
    );
  }
}
