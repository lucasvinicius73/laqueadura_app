import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class PostOperativePage extends StatelessWidget {
  const PostOperativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuidados Pós-Operatórios"),
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
                      Icons.healing,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "O tempo de repouso vai depender do tipo de cirurgia que você fez",
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

            const SizedBox(
              child:
                YouTubePlayerWidget(videoUrl: "https://youtu.be/WvVO9Pz_knk"),
            ),

            const SizedBox(height: 12),

            // Tempo de recuperação por tipo
            const Text(
              "Tempo de Recuperação",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildRecoveryCard(
              title: "Cesárea",
              time: "4 a 6 semanas",
              description: "Recuperação semelhante à do parto cirúrgico",
              icon: Icons.pregnant_woman,
              color: Colors.purple,
            ),

            _buildRecoveryCard(
              title: "Após parto normal",
              time: "2 a 4 semanas",
              description: "Recuperação mais rápida, com liberação médica",
              icon: Icons.child_friendly,
              color: Colors.blue,
            ),

            _buildRecoveryCard(
              title: "Videolaparoscopia",
              time: "7 a 10 dias",
              description: "Recuperação mais rápida, com liberação médica",
              icon: Icons.videocam,
              color: Colors.green,
            ),

            const SizedBox(height: 24),

            // Cuidados importantes
            const Text(
              "Cuidados Importantes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            _buildCareItem(
              icon: Icons.clean_hands,
              title: "Ferida Cirúrgica",
              description:
                  "Mantenha limpa e seca. Evite molhar nas primeiras 24 a 48 horas.",
              color: Colors.teal,
            ),

            _buildCareItem(
              icon: Icons.restaurant,
              title: "Alimentação",
              description: "Prefira refeições leves e ricas em líquidos.",
              color: Colors.orange,
            ),

            _buildCareItem(
              icon: Icons.wash,
              title: "Higiene Íntima",
              description: "Normal, com água e sabão neutro.",
              color: Colors.cyan,
            ),

            _buildCareItem(
              icon: Icons.medication,
              title: "Medicamentos",
              description:
                  "Use apenas os medicamentos indicados pela equipe médica. Não se automedique.",
              color: Colors.red,
            ),

            _buildCareItem(
              icon: Icons.favorite,
              title: "Relações Sexuais",
              description:
                  "Evite por pelo menos 15 dias ou até a liberação do ginecologista.",
              color: Colors.pink,
            ),

            _buildCareItem(
              icon: Icons.calendar_today,
              title: "Retorno Médico",
              description:
                  "Retorne ao posto de saúde ou ao ginecologista para revisão. Somente o profissional de saúde pode confirmar a boa recuperação.",
              color: Colors.indigo,
            ),

            _buildCareItem(
              icon: Icons.science,
              title: "Exames",
              description:
                  "Alguns exames podem ser solicitados após a cirurgia.",
              color: Colors.amber.shade700,
            ),

            const SizedBox(height: 16),

            // Sinais de alerta
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: Colors.red.shade700,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Procure o hospital se houver:",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  _buildAlertItem("Vermelhidão na região da cirurgia"),
                  _buildAlertItem("Secreção na ferida"),
                  _buildAlertItem("Dor intensa"),
                  _buildAlertItem("Febre"),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Mensagem final
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xffD8AEA2),
                    const Color(0xffD8AEA2).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.celebration,
                    color: Colors.white,
                    size: 48,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Você deu um passo importante.",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Agora é hora de se cuidar com carinho, respeitar o seu tempo e celebrar sua autonomia.",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white.withOpacity(0.95),
                      height: 1.5,
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

  Widget _buildRecoveryCard({
    required String title,
    required String time,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.3), width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: color,
              size: 28,
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
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              time,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ),
        ],
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
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: color,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 8,
            color: Colors.red.shade600,
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.red.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

