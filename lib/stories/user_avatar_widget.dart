import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({
    Key? key,
    required this.descricaoAsset,
    this.temGradiente,
    required this.usuario,
    this.heightImage,
    this.widthImage,
    this.heightBorder,
    this.widthBorder,
    this.usuarioLateral,
    this.adicionarStory,
    this.ativarCloseFriend,
    this.radius,
  }) : super(key: key);

  final String descricaoAsset;
  final String usuario;
  final bool? usuarioLateral;
  final double? heightImage;
  final double? widthImage;
  final double? heightBorder;
  final double? widthBorder;
  final bool? temGradiente;
  final bool? adicionarStory;
  final bool? ativarCloseFriend;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    List<Color> defaultColors = const [Color(0xFFFD297B), Color(0xFFFF5864)];
    List<Color> closeFriend = const [Colors.green, Colors.green];
    List<Color> defineCor =
        ativarCloseFriend == true ? closeFriend : defaultColors;

    if (usuarioLateral == true) {
      return temGradiente == true
          ? Row(
              children: _avatarComTextoLateral(defaultColors, defineCor),
            )
          : Row(
              children: _avatarComTextoAbaixo(),
            );
    } else {
      return temGradiente == true
          ? Column(
              children: _avatarComTextoLateral(defaultColors, defineCor),
            )
          : Column(
              children: _avatarComTextoAbaixo(),
            );
    }
  }

  List<Widget> _avatarComTextoLateral(
      List<Color> defaultColors, List<Color> defineCor) {
    return [
      Stack(
        children: [
          Container(
            width: heightImage ?? 100,
            height: heightImage ?? 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: defineCor,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Colors.black,
                child: Container(
                  width: widthBorder ?? 90,
                  height: heightBorder ?? 90,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(descricaoAsset),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      usuarioLateral == true
          ? Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                usuario,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                usuario,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
    ];
  }

  List<Widget> _avatarComTextoAbaixo() {
    return [
      const SizedBox(height: 10),
      CircleAvatar(
        radius: radius ?? 45,
        backgroundColor: Colors.grey,
        child: Stack(
          children: [
            Container(
              width: widthImage ?? 100,
              height: heightImage ?? 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(descricaoAsset),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            adicionarStory == true
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    top: 60,
                    child: Stack(
                      children: [
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            gradient: const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Colors.black, Colors.black]),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: CircleAvatar(
                                radius: 27,
                                child: Icon(Icons.add),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : const Text(''),
          ],
        ),
      ),
      usuarioLateral == true
          ? Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                usuario,
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            )
          : Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                usuario,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
    ];
  }
}
