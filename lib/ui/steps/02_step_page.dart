import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class Step02Page extends StatelessWidget {
  const Step02Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Etapas Antes da Cirurgia'),
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
              'Quais são as etapas antes da cirurgia?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            _buildBulletPoint(
              'Prazo legal: a lei exige no mínimo 60 dias entre o pedido e a cirurgia, tempo reservado para reflexão, orientações e planejamento.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Documentação: a mulher deve assinar o Termo de Consentimento Livre e Esclarecido, confirmando que foi informada sobre riscos, irreversibilidade e alternativas.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Acompanhamento multiprofissional: atendimento com médico, psicólogo e assistente social para garantir informação, apoio e aconselhamento.',
            ),
            SizedBox(height: 16),
            Text(
              'Exceções:',
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
                    'Se a cirurgia for realizada no parto, o pedido também deve ter sido feito com 60 dias de antecedência.',
                  ),
                  SizedBox(height: 8),
                  _buildSubBulletPoint(
                    'Em casos de risco à saúde da mulher ou do bebê, dois médicos devem atestar a necessidade.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _buildBulletPoint(
              'Documentos exigidos: RG, CPF, comprovante de residência, registro dos filhos vivos e, quando necessário, laudos médicos.',
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
