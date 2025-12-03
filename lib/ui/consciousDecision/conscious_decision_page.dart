import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/consciousDecision/widgets/method_card.dart';
import 'package:laqueadura_app/ui/consciousDecision/widgets/confirmation_dialog.dart';

class ConsciousDecisionPage extends StatelessWidget {
  const ConsciousDecisionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Decisão Consciente"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mensagem inicial
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
              child: const Text(
                "Antes de tomar a decisão pelo método definitivo, conheça todas as opções de contraceptivos.\n\n"
                "Os métodos podem ser reversíveis, quando você pode interromper o uso e engravidar no futuro, "
                "ou irreversíveis, quando a decisão é permanente.",
                style: TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 24),

            // Métodos Reversíveis
            _buildSectionTitle("Métodos Reversíveis", Icons.refresh),
            const SizedBox(height: 16),

            const MethodCard(
              title: "Pílula anticoncepcional",
              advantage: "Fácil de usar e acessível.",
              disadvantage: "Se esquecer de tomar, pode falhar.",
              icon: Icons.medication,
              color: Color(0xFF8BC34A),
            ),
            const MethodCard(
              title: "Injeção anticoncepcional",
              subtitle: "(mensal ou trimestral)",
              advantage: "Não precisa lembrar todos os dias.",
              disadvantage:
                  "Pode alterar o ciclo menstrual e exige aplicação regular.",
              icon: Icons.vaccines,
              color: Color(0xFF03A9F4),
            ),
            const MethodCard(
              title: "Adesivo e anel vaginal",
              advantage: "Discretos e eficazes.",
              disadvantage:
                  "Podem causar efeitos colaterais e exigem troca semanal ou mensal.",
              icon: Icons.circle_outlined,
              color: Color(0xFFE91E63),
            ),
            const MethodCard(
              title: "Implante subdérmico",
              advantage: "Dura até 3 anos, eficácia superior a 99%.",
              disadvantage: "Exige procedimento médico e pode alterar o ciclo.",
              icon: Icons.linear_scale,
              color: Color(0xFF9C27B0),
            ),
            const MethodCard(
              title: "DIU",
              subtitle: "(cobre ou hormonal)",
              advantage: "Eficácia acima de 99%, pode durar de 5 a 10 anos.",
              disadvantage:
                  "Pode causar cólicas ou alterações menstruais nos primeiros meses.",
              icon: Icons.change_history,
              color: Color(0xFFFF9800),
            ),
            const MethodCard(
              title: "Camisinha feminina e masculina",
              advantage: "Único método que também protege contra ISTs.",
              disadvantage:
                  "Precisa ser usada corretamente em todas as relações.",
              icon: Icons.shield,
              color: Color(0xFF00BCD4),
            ),

            const SizedBox(height: 24),

            // Métodos Irreversíveis
            _buildSectionTitle(
                "Métodos Irreversíveis (Definitivos)", Icons.block),
            const SizedBox(height: 16),

            const MethodCard(
              title: "Laqueadura",
              subtitle: "(mulher)",
              advantage: "Eficácia acima de 99%, segurança permanente.",
              disadvantage: "Definitiva e irreversível.",
              icon: Icons.female,
              color: Color(0xffD8AEA2),
              isDefinitive: true,
            ),
            const MethodCard(
              title: "Vasectomia",
              subtitle: "(homem)",
              advantage:
                  "Cirurgia simples, rápida recuperação, eficácia acima de 99%.",
              disadvantage: "Também é definitiva e irreversível.",
              icon: Icons.male,
              color: Color(0xFF607D8B),
              isDefinitive: true,
            ),

            const SizedBox(height: 24),

            // Informação importante
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
                        Icons.info_outline,
                        color: Colors.amber.shade700,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "Importante:",
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
                    "• Você pode desistir da decisão até o momento da cirurgia.\n\n"
                    "• Converse com o médico, psicólogo e assistente social para tirar todas as dúvidas.\n\n"
                    "• Todos os métodos listados estão disponíveis gratuitamente pelo SUS.",
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // Pergunta final
            Center(
              child: Text(
                "Você tem certeza da sua escolha?",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey.shade800,
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 20),

            // Botões de confirmação
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ConfirmationDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD8AEA2),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.check_circle, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Sim, quero seguir com a laqueadura",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  side: BorderSide(color: Colors.grey.shade400),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.refresh,
                      color: Colors.grey.shade600,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        "Quero rever outras opções",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
        Expanded(
          child: Text(
            title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xff333333),
            ),
          ),
        ),
      ],
    );
  }
}
