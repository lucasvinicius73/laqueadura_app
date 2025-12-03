import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class Step03Page extends StatelessWidget {
  const Step03Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Acompanhamento'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YouTube Player no topo
            YouTubePlayerWidget(
              videoUrl:
                  'https://www.youtube.com/watch?v=dQw4w9WgXcQ', // Substitua pela URL real do vídeo
            ),
            SizedBox(height: 24),
            Text(
              'Quem vai te acompanhar nesse processo?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            _buildProfessionalSection(
              'Médico da Unidade Básica',
              [
                'É o primeiro a ouvir sua decisão.',
                'Registra o pedido no prontuário, explica os critérios legais e inicia os encaminhamentos.',
                'Também orienta sobre outras opções contraceptivas.',
              ],
            ),
            SizedBox(height: 16),
            _buildProfessionalSection(
              'Assistente Social',
              [
                'Garante que você seja ouvida e bem orientada.',
                'Ajuda a organizar a documentação e acompanha o processo.',
              ],
            ),
            SizedBox(height: 16),
            _buildProfessionalSection(
              'Psicólogo(a)',
              [
                'Oferece espaço para refletir com clareza.',
                'Acolhe dúvidas, sentimentos e expectativas, sem julgamentos.',
              ],
            ),
            SizedBox(height: 16),
            _buildProfessionalSection(
              'Médico(a) Ginecologista',
              [
                'Explica os detalhes da cirurgia.',
                'Solicita exames como: sangue, eletrocardiograma, avaliação pré-anestésica, ultrassonografia e PCCU.',
                'Confirma que você está apta para a cirurgia.',
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfessionalSection(String title, List<String> points) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            fontFamily: "QuickSand",
            color: Colors.blue[800],
          ),
        ),
        SizedBox(height: 8),
        ...points.map((point) => Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: _buildBulletPoint(point),
            )),
      ],
    );
  }

  Widget _buildBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(
            fontSize: 18,
            fontFamily: "QuickSand",
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "QuickSand",
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
