import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class StepDetailPage extends StatelessWidget {
  final int stepNumber;

  const StepDetailPage({super.key, required this.stepNumber});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('O que é laqueadura?'),
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
              'O que é laqueadura e como funciona o procedimento',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            _buildBulletPoint(
              'A laqueadura, ou ligadura tubária, é um método contraceptivo cirúrgico e definitivo, seguro e feito apenas por profissionais de saúde.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Como funciona: as trompas são cortadas, amarradas ou bloqueadas, impedindo que o óvulo encontre o espermatozoide.',
            ),
            SizedBox(height: 16),
            Text(
              'Formas de realizar:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSubBulletPoint(
                    'Durante a cesariana, aproveitando a cirurgia do parto.',
                  ),
                  SizedBox(height: 8),
                  _buildSubBulletPoint(
                    'Por videolaparoscopia, com pequenas incisões no abdômen e uso de câmera (quase sem cicatriz).',
                  ),
                  SizedBox(height: 8),
                  _buildSubBulletPoint(
                    'Por minilaparotomia, com pequeno corte no baixo ventre, geralmente logo após o parto normal.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildBulletPoint('Eficácia: superior a 99%.'),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Irreversibilidade: é definitiva; a reversão é cara, difícil e nem sempre possível.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'O que não muda: não altera os hormônios, não afeta a menstruação, nem o desejo sexual. ❌ Não previne ISTs.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Indicação: para mulheres a partir de 21 que têm certeza de que não querem mais filhos.',
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
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

  Widget _buildSubBulletPoint(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '• ',
          style: TextStyle(
            fontSize: 16,
            fontFamily: "QuickSand",
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              fontFamily: "QuickSand",
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
