import 'package:flutter/material.dart';

class LearnMorePage extends StatelessWidget {
  const LearnMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Container
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFF1E1DD),
                  Color(0xFFD9B2AA),
                ],
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 8.0),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back,
                              color: Colors.black87),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "Saiba mais",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black87,
                            fontFamily: 'QuickSand',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.info_outline,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    "Saiba mais",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontFamily: 'QuickSand',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    "Informações institucionais do aplicativo",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontFamily: 'QuickSand',
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          // Body List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                _buildInfoCard(
                  "O aplicativo LAQUES foi desenvolvido em um curso de Mestrado Profissional no Brasil, com o objetivo de oferecer orientações qualificadas, baseadas em evidências científicas, envolvendo o período pré e pós-operatório da laqueadura tubária.\n\nA ferramenta digital tem a finalidade de apoiar mulheres no acesso às informações seguras, de forma objetiva e de diferentes formatos (escrita, audiovisual e libras), contribuindo para a tomada de decisão informada, o preparo adequado para o procedimento e o acompanhamento pós-operatório.",
                ),
                const SizedBox(height: 16),
                _buildInfoCard(
                  "Desenvolvedores do aplicativo: Lauany Silva de Medeiros, Amanda da Costa Silveira Sabbá, Mariana de Sousa Ribeiro de Carvalho.",
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF9E8EB), // Light pinkish background
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Placeholders for the logos as they are not found in the assets folder
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 50,
                              child:
                                  Image.asset("assets/about/logoCipe.png")),
                          SizedBox(
                              width: 50,
                              child: Image.asset("assets/about/brasaouepa.png")),
                          SizedBox(
                              width: 50,
                              child: Image.asset("assets/about/logoCapes.png")),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String text) {
    final paragraphs = text.split('\n\n');
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFF9E8EB),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: paragraphs.map((paragraph) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: paragraph == paragraphs.last ? 0.0 : 8.0),
            child: Text.rich(
              TextSpan(
                children: [
                  const WidgetSpan(
                    child: SizedBox(width: 24.0), // Indentação da primeira linha
                  ),
                  TextSpan(text: paragraph),
                ],
              ),
              textAlign: TextAlign.justify,
              style: const TextStyle(
                fontSize: 18,
                color: Color(0xFF3B1015),
                fontFamily: 'QuickSand',
                fontWeight: FontWeight.w500,
                height: 1.3,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildLogoPlaceholder(String name, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: 16,
        ),
      ),
    );
  }
}
