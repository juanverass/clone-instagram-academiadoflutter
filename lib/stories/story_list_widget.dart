import 'package:clone_tela_instagram/stories/user_avatar_widget.dart';
import 'package:flutter/material.dart';

class StoryListWidget extends StatelessWidget {
  const StoryListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 125,
        child: ListView(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: const [
            UserAvatarWidget(
              descricaoAsset: 'assets/flecha.jpg',
              temGradiente: false,
              usuario: 'Seu Story',
              adicionarStory: true,
            ),
            SizedBox(width: 10.0),
            UserAvatarWidget(
                descricaoAsset: 'assets/senhora_incrivel_story.png',
                temGradiente: true,
                usuario: 'Sra.Incrivel'),
            SizedBox(width: 10.0),
            UserAvatarWidget(
                descricaoAsset: 'assets/edna_story.jpg',
                temGradiente: true,
                usuario: 'Edna'),
            SizedBox(width: 10.0),
            UserAvatarWidget(
                descricaoAsset: 'assets/gelado_story.jpg',
                temGradiente: true,
                usuario: 'fica.frio.ai',
                ativarCloseFriend: true),
            SizedBox(width: 10.0),
            UserAvatarWidget(
                descricaoAsset: 'assets/sindrome_story.jpg',
                temGradiente: true,
                usuario: 'Sindrome'),
            SizedBox(width: 10.0),
            UserAvatarWidget(
              descricaoAsset: 'assets/escavador.jpg',
              temGradiente: true,
              usuario: 'oescavador',
            ),
            SizedBox(width: 10.0),
            UserAvatarWidget(
              descricaoAsset: 'assets/usuario_nulo.png',
              temGradiente: true,
              usuario: 'usernull',
            ),
          ],
        ));
  }
}
