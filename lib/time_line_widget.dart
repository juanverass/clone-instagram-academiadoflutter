import 'package:clone_tela_instagram/post/post_widget.dart';
import 'package:clone_tela_instagram/stories/story_list_widget.dart';
import 'package:flutter/material.dart';

class TimeLineWidget extends StatelessWidget {
  TimeLineWidget({super.key});

  final List<Map<String, dynamic>> familiaIncrivelList = [
    {
      'id': 0,
      'imagem': 'assets/familia_incrivel.jpg',
    },
    {
      'id': 1,
      'imagem': 'assets/foto_2.jpg',
    },
    {
      'id': 2,
      'imagem': 'assets/foto_3.jpeg',
    },
    {
      'id': 3,
      'imagem': 'assets/foto_4.jpg',
    },
  ];

  final List<Map<String, dynamic>> geladoFeed = [
    {
      'id': 0,
      'imagem': 'assets/cade_meu_uniforme.png',
    },
  ];

  final List<Map<String, dynamic>> ednaList = [
    {
      'id': 0,
      'imagem': 'assets/edna_feed.jpg',
    },
    {
      'id': 1,
      'imagem': 'assets/edna_feed_2.jpeg',
    },
  ];

  final List<Map<String, dynamic>> devList = [
    {
      'id': 0,
      'imagem': 'assets/apresentacao.png',
    },
    {
      'id': 1,
      'imagem': 'assets/informacoes.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const StoryListWidget(),
          Divider(color: Colors.grey.shade900),
          PostWidget(
            assetList: devList,
            perfilImage: 'assets/desenvolvedor.jpg',
            user: 'juan.verass',
            story: false,
            radius: 20,
            legenda: 'Um pouco sobre mim.',
            curtidas: 'Sr.Incrivel, Sra.Incrivel, Edna, fica.frio.ai e outros 1M',
          ),
          const SizedBox(height: 10.0),
          PostWidget(
            assetList: familiaIncrivelList,
            perfilImage: 'assets/senhor_incrivel_perfil.png',
            user: 'Sr.Incrivel',
            story: true,
            legenda: 'Nada como um dia em familia salvando o mundo!',
            curtidas: '4.567.398',
          ),
          const SizedBox(height: 10.0),
          PostWidget(
            assetList: geladoFeed,
            perfilImage: 'assets/gelado_story.jpg',
            user: 'fica.frio.ai',
            story: true,
            closeFriend: true,
            legenda: 'O super-herói compromissado não tem um dia de paz',
            curtidas: '1.732.994',
          ),
          const SizedBox(height: 10),
          PostWidget(
            assetList: ednaList,
            perfilImage: 'assets/edna_story.jpg',
            user: 'Edna',
            story: true,
            legenda: 'A Verdadeira vilã',
            curtidas: '2.000.000'
          ),
        ],
      ),
    );
  }
}
