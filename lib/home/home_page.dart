import 'package:flutter/material.dart';

import '../bottom_navigator/bottom_navigation_widget.dart';
import '../time_line_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              alignment: Alignment.topLeft,
              height: mediaQuery.size.width * 0.1,
              child: Image.asset(
                'assets/instagram_logo.svg.png',
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
            IconButton(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: const Icon(
                Icons.keyboard_arrow_down,
                size: 20,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.mark_chat_unread_outlined),
          ),
        ],
        backgroundColor: Colors.black,
      ),
      bottomNavigationBar: const BottomNavigationWidget(),
      body: TimeLineWidget(),
    );
  }
}
