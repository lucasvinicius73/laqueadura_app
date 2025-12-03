import 'package:flutter/material.dart';

class PartnerPage extends StatelessWidget {
  const PartnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Área do Parceiro",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header com ícone
            Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: const Color(0xFF607D8B).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.people,
                  size: 50,
                  color: Color(0xFF607D8B),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Card introdutório
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xffD8AEA2).withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color(0xffD8AEA2),
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.handshake,
                        color: const Color(0xFF5B2F22),
                        size: 28,
                      ),
                      const SizedBox(width: 10),
                      const Expanded(
                        child: Text(
                          "O seu papel no planejamento familiar",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF5B2F22),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Você também é responsável pelas decisões sobre ter ou não filhos. "
                    "Conversar com sua parceira fortalece a escolha livre e consciente. "
                    "O seu apoio é fundamental em todas as etapas.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Seção Vasectomia
            _buildSectionTitle("Método definitivo masculino – Vasectomia", Icons.male),
            const SizedBox(height: 12),

            const _ExpandableInfoCard(
              title: "O que é a vasectomia?",
              icon: Icons.cut,
              color: Color(0xFF607D8B),
              content:
                  "A vasectomia é uma cirurgia simples que interrompe os canais deferentes, "
                  "impedindo a saída dos espermatozoides.",
            ),
            const _ExpandableInfoCard(
              title: "Efeitos nos testículos",
              icon: Icons.info_outline,
              color: Color(0xFF2196F3),
              content:
                  "A vasectomia não altera o tamanho dos seus testículos: Eles continuam "
                  "produzindo hormônios masculinos (como a testosterona) normalmente.\n\n"
                  "A produção de espermatozoides também continua, mas como os canais deferentes "
                  "são bloqueados, os espermatozoides não saem no sêmen e são reabsorvidos pelo organismo.",
            ),
            const _ExpandableInfoCard(
              title: "Vida sexual após a cirurgia",
              icon: Icons.favorite,
              color: Color(0xFFE91E63),
              content:
                  "O desejo sexual, a potência e o prazer não sofrem alterações. "
                  "E nem a capacidade de ter relações.",
            ),
            const _ExpandableInfoCard(
              title: "Recuperação e eficácia",
              icon: Icons.healing,
              color: Color(0xFF4CAF50),
              content:
                  "A recuperação costuma ser rápida, entre 7 e 10 dias.\n\n"
                  "Após a cirurgia, você deve fazer um exame de espermograma para confirmar a eficácia.\n\n"
                  "Normalmente, a eliminação completa dos espermatozoides pode levar cerca de "
                  "2 a 3 meses ou 20 a 30 ejaculações.\n\n"
                  "Até a confirmação do exame, você deve continuar usando preservativo.",
            ),

            const SizedBox(height: 24),

            // Seção Direitos
            _buildSectionTitle("Seus direitos", Icons.gavel),
            const SizedBox(height: 12),

            const _ExpandableInfoCard(
              title: "Direito à decisão",
              icon: Icons.check_circle,
              color: Color(0xFF9C27B0),
              content:
                  "Você tem o direito de decidir, de forma livre e consciente, sobre realizar a vasectomia.",
            ),
            const _ExpandableInfoCard(
              title: "Acesso pelo SUS",
              icon: Icons.local_hospital,
              color: Color(0xFFFF5722),
              content:
                  "O SUS deve oferecer o procedimento gratuitamente. Vá à sua unidade de saúde de "
                  "referência para receber mais informações.",
            ),
            const _ExpandableInfoCard(
              title: "Consentimento",
              icon: Icons.person,
              color: Color(0xFF00BCD4),
              content:
                  "Não é necessário o consentimento da sua parceira, mas o aconselhamento "
                  "multiprofissional é recomendado.",
            ),

            const SizedBox(height: 24),

            // Card de alerta importante
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.amber.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.amber.shade300,
                  width: 1,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber,
                        color: Colors.amber.shade700,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Importante lembrar",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "• A vasectomia é um procedimento definitivo e irreversível.\n\n"
                    "• Você deve continuar usando preservativos até a confirmação médica da eficácia.\n\n"
                    "• Assim como a laqueadura, essa decisão deve ser tomada de forma livre, consciente e sem pressões externas.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Seção Diálogo
            _buildSectionTitle("Converse com sua parceira", Icons.chat),
            const SizedBox(height: 12),

            const _ExpandableInfoCard(
              title: "Diálogo aberto",
              icon: Icons.forum,
              color: Color(0xFFD8AEA2),
              content:
                  "A escolha do método contraceptivo deve ser feita em diálogo entre você e sua parceira.\n\n"
                  "Conversem abertamente sobre o desejo ou não de ter filhos no futuro.",
            ),
            const _ExpandableInfoCard(
              title: "Avaliando as opções",
              icon: Icons.compare_arrows,
              color: Color(0xFF795548),
              content:
                  "Avaliem juntos os prós e contras de cada método disponível.\n\n"
                  "Lembrem-se de que tanto a laqueadura quanto a vasectomia são definitivas e "
                  "irreversíveis, mas possuem taxa de falha.",
            ),
            const _ExpandableInfoCard(
              title: "Apoio profissional",
              icon: Icons.medical_services,
              color: Color(0xFF3F51B5),
              content:
                  "Contem sempre com o apoio da equipe multiprofissional (médico, enfermeiro, "
                  "psicólogo, serviço social) para esclarecer dúvidas.\n\n"
                  "A decisão é de vocês e deve ser tomada de forma livre, consciente e responsável.",
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: const Color(0xffD8AEA2),
          size: 28,
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF5B2F22),
            ),
          ),
        ),
      ],
    );
  }
}

class _ExpandableInfoCard extends StatefulWidget {
  const _ExpandableInfoCard({
    required this.title,
    required this.icon,
    required this.color,
    required this.content,
  });

  final String title;
  final IconData icon;
  final Color color;
  final String content;

  @override
  State<_ExpandableInfoCard> createState() => _ExpandableInfoCardState();
}

class _ExpandableInfoCardState extends State<_ExpandableInfoCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.15),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: widget.color.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        widget.icon,
                        color: widget.color,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: Colors.grey.shade400,
                    ),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      widget.content,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.5,
                      ),
                    ),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 200),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
