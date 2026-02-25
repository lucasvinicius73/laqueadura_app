import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class PreOperativePage extends StatelessWidget {
  const PreOperativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuidados Pré-Operatórios"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFFCD5E91),
                    const Color(0xFFCD5E91).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.medical_services_outlined,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Os principais cuidados que você deverá realizar antes da cirurgia são:",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            const SizedBox(child: 
              YouTubePlayerWidget(videoUrl:
                "https://youtu.be/vhcKrzNOQqE")
            ),

            const SizedBox(height: 12),

            // Lista de cuidados
            _buildCareItem(
              icon: Icons.no_food,
              title: "Jejum",
              description:
                  "Normalmente, você deve ficar 8 horas sem comer e 2 horas sem beber líquidos. Siga exatamente as orientações do hospital.",
              color: Colors.orange,
            ),

            _buildCareItem(
              icon: Icons.shower,
              title: "Higiene",
              description:
                  "Tome banho com sabão neutro no dia da cirurgia. Evite cremes, perfumes e maquiagem.",
              color: Colors.blue,
            ),

            _buildCareItem(
              icon: Icons.checkroom,
              title: "Vestuário",
              description: "Vá com roupas leves e confortáveis.",
              color: Colors.green,
            ),

            _buildCareItem(
              icon: Icons.content_cut,
              title: "Depilação",
              description:
                  "Não é necessário depilar totalmente a região íntima. Se for preciso, a equipe de enfermagem fará a raspagem apenas no local da cirurgia.",
              color: Colors.purple,
            ),

            _buildCareItem(
              icon: Icons.medication,
              title: "Medicamentos",
              description:
                  "Se você usa medicamentos contínuos (como para pressão ou diabetes), confirme com a equipe médica se deve tomá-los no dia da cirurgia.",
              color: Colors.red,
            ),

            _buildCareItem(
              icon: Icons.description,
              title: "Documentos",
              description:
                  "Não esqueça os documentos! Verifique se os seus exames ainda estão dentro da validade. Se estiverem vencidos, será necessário refazê-los antes da cirurgia.",
              color: Colors.amber.shade700,
            ),

            _buildCareItem(
              icon: Icons.people,
              title: "Acompanhante",
              description:
                  "Ter um acompanhante durante a internação é seu direito. Escolha alguém de confiança.",
              color: Colors.teal,
            ),

            _buildCareItem(
              icon: Icons.access_time,
              title: "Internação",
              description:
                  "A internação geralmente é rápida: em muitos casos, a alta acontece no mesmo dia ou no dia seguinte.",
              color: Colors.indigo,
            ),

            _buildCareItem(
              icon: Icons.favorite,
              title: "Preparo Emocional",
              description:
                  "O preparo não é só físico, mas também emocional: Converse com pessoas de confiança e tire todas as suas dúvidas com a equipe de saúde.",
              color: Colors.pink,
            ),

            const SizedBox(height: 24),

            // Mensagem final
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.check_circle,
                    color: Colors.green.shade600,
                    size: 48,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Seguir esses cuidados vai ajudar você a chegar tranquila e segura para a cirurgia.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.green.shade700,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "A equipe de saúde estará ao seu lado em todas as etapas.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.green.shade600,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildCareItem({
    required IconData icon,
    required String title,
    required String description,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              color: color,
              size: 24,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

