import 'package:flutter/material.dart';

import '../stories/user_avatar_widget.dart';

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.black,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Icon(
                Icons.home_filled,
                color: Colors.white,
                size: 40,
              ),
              onTap: () {},
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Icon(
                Icons.search,
                color: Colors.white,
                size: 40,
              ),
              onTap: () {},
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Icon(
                Icons.ondemand_video_rounded,
                color: Colors.white,
                size: 40,
              ),
              onTap: () {},
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const Icon(
                Icons.add_business_outlined,
                color: Colors.white,
                size: 40,
              ),
              onTap: () {},
            ),
            InkWell(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: const UserAvatarWidget(
                descricaoAsset: 'assets/flecha.jpg',
                temGradiente: false,
                heightBorder: 40,
                widthBorder: 40,
                heightImage: 50,
                widthImage: 50,
                radius: 15,
                usuario: '',
                usuarioLateral: true,
                ativarCloseFriend: false,
              ),
              onTap: () {},
            ),
          ],
        ));
  }
}
