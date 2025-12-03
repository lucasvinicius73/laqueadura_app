import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class Step04Page extends StatelessWidget {
  const Step04Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Processo no SUS'),
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
              'Como funciona o processo da laqueadura no SUS?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: "QuickSand",
              ),
            ),
            SizedBox(height: 20),
            _buildBulletPoint(
              'Pedido na UBS: a mulher manifesta seu desejo, o médico escuta e abre o processo.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Encaminhamento: conversa com assistente social e psicóloga, que apresentam alternativas e confirmam se a decisão é consciente.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Reflexão em casa: a mulher pode conversar com familiares ou parceiro. A autorização do cônjuge não é obrigatória — a decisão é individual.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Confirmação: a mulher retorna à UBS e reafirma sua decisão.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Consulta com ginecologista: explicação detalhada do procedimento e solicitação de exames (sangue, eletrocardiograma, avaliação pré-anestésica, ultrassonografia e ginecológicos). Em alguns municípios, também é exigido laudo de risco cirúrgico.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Entrega dos exames e assinaturas: a mulher e os profissionais assinam o termo de consentimento.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Agendamento: a cirurgia é marcada respeitando o prazo mínimo de 60 dias após o pedido.',
            ),
            SizedBox(height: 12),
            _buildBulletPoint(
              'Cirurgia pelo SUS: a laqueadura é realizada com apoio da equipe multiprofissional e de forma gratuita, como parte do direito ao planejamento familiar.',
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
