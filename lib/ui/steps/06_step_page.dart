import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class Step06Page extends StatelessWidget {
  const Step06Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Processo pela Rede Privada'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // YouTube Player no topo
            YouTubePlayerWidget(
              videoUrl:
                  'https://youtu.be/5Vn7ctDPtyE', // Substitua pela URL real do vídeo
            ),
            SizedBox(height: 24),
            Text(
              'Como funciona o processo da laqueadura na Rede Privada?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            _buildBulletPoint(
              'A laqueadura pela rede privada é feita em hospitais ou clínicas particulares, por plano de saúde ou pagamento particular.',
            ),

            SizedBox(height: 12),
            _buildBulletPoint(
              'Consulta médica: Tudo começa com uma consulta com o(a) ginecologista. O profissional avalia sua saúde, tira dúvidas e confirma se a laqueadura é a melhor opção para você.',
            ),

            SizedBox(height: 12),
            _buildBulletPoint(
              'Regras legais: Mesmo sendo particular, a laqueadura segue a lei. É preciso:',
            ),
            SizedBox(height: 12),

            Center(
              child: Column(
                children: [
                  const Text(
                    'Decisão consciente da mulher',
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Assinatura do termo de consentimento',
                  ),
                  
                  const SizedBox(height: 4),
                  const Text(
                    'Cumprimento dos prazos exigidos por lei',
                  ),
                ],
              ),
            ),

            SizedBox(height: 12),
            _buildBulletPoint(
              'Exames e preparo: Antes da cirurgia, são solicitados exames e dadas orientações sobre jejum e uso de medicamentos.',
            ),

            SizedBox(height: 12),
            _buildBulletPoint(
              'Custos: O valor varia conforme o hospital, o médico e se o plano de saúde cobre o procedimento.',
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
}
