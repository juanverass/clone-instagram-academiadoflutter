import 'package:flutter/material.dart';

import '../stories/user_avatar_widget.dart';

class PostWidget extends StatefulWidget {
  final List<Map<String, dynamic>> assetList;
  final String perfilImage;
  final String? user;
  final bool? story;
  final bool? closeFriend;
  final double? radius;
  final String? legenda;
  final String? curtidas;
  const PostWidget(
      {super.key,
      required this.assetList,
      required this.perfilImage,
      required this.user,
      this.story,
      this.closeFriend,
      this.radius,
      this.legenda,
      this.curtidas});

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  final PageController _pageController = PageController(viewportFraction: 1.2);
  int _paginaAtual = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_paginaAtual != next) {
        setState(() {
          _paginaAtual = next;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.59,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    UserAvatarWidget(
                      descricaoAsset: widget.perfilImage,
                      temGradiente: widget.story,
                      heightBorder: 40,
                      widthBorder: 40,
                      heightImage: 50,
                      widthImage: 50,
                      radius: widget.radius,
                      usuario: widget.user ?? '',
                      usuarioLateral: true,
                      ativarCloseFriend: widget.closeFriend,
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Icon(
                      Icons.keyboard_control_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: widget.assetList.length,
                itemBuilder: (_, currentIndex) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Image.asset(
                      widget.assetList[currentIndex]['imagem'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: _buildBullets(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: 'Curtido por',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      const WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ), // Adiciona um espaço de 5 pixels entre os textos
                      ),
                      TextSpan(
                        text: widget.curtidas,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5),
              child: Container(
                alignment: Alignment.centerLeft,
                child: RichText(
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: widget.user,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    children: [
                      const WidgetSpan(
                        child: SizedBox(
                          width: 5,
                        ), // Adiciona um espaço de 5 pixels entre os textos
                      ),
                      TextSpan(
                        text: widget.legenda,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBullets() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Icon(
                      Icons.messenger_outline_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    splashColor: Colors.transparent,
                    child: const Icon(
                      Icons.send_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            widget.assetList.length > 1
                ? Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: widget.assetList.asMap().entries.map((entry) {
                        int index = entry.key;
                        return InkWell(
                          onTap: () {
                            setState(() {
                              _pageController.jumpToPage(index);
                              _paginaAtual = index;
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.all(2),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: _paginaAtual == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                  ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: InkWell(
                  onTap: () {},
                  splashColor: Colors.transparent,
                  child: const Icon(
                    Icons.bookmark_border_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
