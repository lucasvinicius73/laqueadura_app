import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/laws/pdf_viewer_page.dart';
import 'package:laqueadura_app/ui/laws/widgets/expandable_law_card.dart';
import 'package:laqueadura_app/ui/widgets/youtube_player_widget.dart';

class LawsPage extends StatelessWidget {
  const LawsPage({super.key});

  void _openPdf(BuildContext context, String title, String assetPath) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PdfViewerPage(
          title: title,
          assetPath: assetPath,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planejamento Familiar"),
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
                    const Color(0xffD8AEA2),
                    const Color(0xffD8AEA2).withOpacity(0.7),
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
                      Icons.gavel,
                      color: Colors.white,
                      size: 40,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Lei de Planejamento Familiar",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Conheça seus direitos e as leis que garantem seu acesso à laqueadura",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white.withOpacity(0.9),
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 8),

            const SizedBox(
              child: 
                YouTubePlayerWidget(videoUrl: "https://youtu.be/ZLxxgcjLzqQ"),
            ),

            const SizedBox(height: 8),

            // Dica
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xffD8AEA2).withOpacity(0.15),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.touch_app,
                    color: const Color(0xFF5B2F22),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "Toque em cada tópico para ver mais detalhes",
                      style: TextStyle(
                        fontSize: 13,
                        color: const Color(0xFF5B2F22),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // 1. O que é o Planejamento Familiar?
            const ExpandableLawCard(
              number: "1",
              title: "O que é o Planejamento Familiar?",
              icon: Icons.family_restroom,
              color: Color(0xffD8AEA2),
              content:
                  '''O Planejamento Familiar é um direito garantido por lei. Toda mulher tem autonomia para decidir se quer ter filhos, quando e quantos, com acesso gratuito a métodos contraceptivos pelo SUS.''',
              legalBases: [
                "Lei nº 9.263/1996",
                "Lei nº 14.443/2022",
                "Nota Técnica nº 34/2023 – Ministério da Saúde",
              ],
            ),

            // 2. Direitos Garantidos
            ExpandableLawCard(
              number: "2",
              title: "Direitos Garantidos",
              icon: Icons.verified_user,
              color: Colors.green.shade600,
              bulletPoints: const [
                "Acesso gratuito a métodos contraceptivos no SUS",
                "Disponibilização dos métodos em até 30 dias úteis",
                "Direito à decisão individual, sem necessidade de autorização do cônjuge",
                "Direito ao aconselhamento com equipe multiprofissional antes de procedimentos definitivos",
              ],
            ),

            // 3. Requisitos para Laqueadura
            ExpandableLawCard(
              number: "3",
              title: "Requisitos para Laqueadura",
              icon: Icons.checklist,
              color: Colors.orange.shade600,
              content: "Para realizar a laqueadura, a mulher deve:",
              requirements: const [
                RequirementItem(
                  text: "Ter 21 anos ou mais",
                  isOr: false,
                ),
                RequirementItem(
                  text: "Ter pelo menos 2 filhos vivos",
                  isOr: true,
                ),
              ],
              additionalPoints: const [
                "Possuir capacidade civil plena (a partir dos 18 anos)",
                "Assinar o Termo de Consentimento Livre e Esclarecido (TCLE)",
                "Respeitar o prazo mínimo de 60 dias entre o pedido e a cirurgia",
                "Passar por acompanhamento multiprofissional com orientação sobre todos os métodos disponíveis",
                "Realizar o procedimento em hospital, com equipe especializada",
              ],
            ),

            // 4. Novidades da Lei nº 14.443/2022
            ExpandableLawCard(
              number: "4",
              title: "Novidades da Lei nº 14.443/2022",
              icon: Icons.new_releases,
              color: Colors.purple.shade600,
              isHighlighted: true,
              bulletPoints: const [
                "Redução da idade mínima de 25 para 21 anos",
                "Revogação da exigência de autorização do cônjuge",
                "Autorização da laqueadura no parto, desde que:\n   • A manifestação da vontade tenha sido registrada com 60 dias de antecedência\n   • Haja condições clínicas adequadas",
                "Fim da exigência de cesarianas anteriores como pré-requisito",
                "O SUS deve garantir o acesso universal, gratuito e ágil a todos os métodos contraceptivos legalmente reconhecidos",
              ],
            ),

            // 5. Casos Especiais
            ExpandableLawCard(
              number: "5",
              title: "Casos Especiais",
              icon: Icons.info_outline,
              color: Colors.teal.shade600,
              specialCases: const [
                SpecialCase(
                  title: "Gestantes",
                  description: "Podem manifestar interesse durante o pré-natal",
                ),
                SpecialCase(
                  title: "Pós-parto (cesárea ou parto normal)",
                  description: "Permitido, com prazo respeitado",
                ),
                SpecialCase(
                  title: "Risco à saúde",
                  description:
                      "Laqueadura pode ser feita mediante laudo assinado por dois médicos",
                ),
              ],
            ),

            // 6. Referências
            ExpandableLawCard(
              number: "6",
              title: "Referências Legais",
              icon: Icons.menu_book,
              color: Colors.indigo.shade600,
              references: [
                ReferenceItem(
                  title: "Lei nº 9.263/1996",
                  description:
                      "Regula o § 7º do art. 226 da Constituição Federal, que trata do planejamento familiar",
                  assetPath: "assets/laws/L9263.pdf",
                  onTap: () => _openPdf(
                    context,
                    "Lei nº 9.263/1996",
                    "assets/laws/L9263.pdf",
                  ),
                ),
                ReferenceItem(
                  title: "Lei nº 14.443/2022",
                  description:
                      "Altera a Lei nº 9.263/1996 para determinar prazo para oferecimento de métodos e técnicas contraceptivas",
                  assetPath: "assets/laws/L14443.pdf",
                  onTap: () => _openPdf(
                    context,
                    "Lei nº 14.443/2022",
                    "assets/laws/L14443.pdf",
                  ),
                ),
                ReferenceItem(
                  title: "Nota Técnica nº 34/2023",
                  description:
                      "COSMU/CGACI/DGCI/SAPS/MS - Orientações sobre planejamento reprodutivo",
                  assetPath: "assets/laws/sei.pdf",
                  onTap: () => _openPdf(
                    context,
                    "Nota Técnica nº 34/2023",
                    "assets/laws/sei.pdf",
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Mensagem final
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xffD8AEA2).withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: const Color(0xffD8AEA2),
                ),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.lightbulb_outline,
                    color: Color(0xffD8AEA2),
                    size: 32,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Conhecer seus direitos é o primeiro passo para exercê-los.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Em caso de dúvidas, procure a equipe de saúde da sua unidade.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
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
}
