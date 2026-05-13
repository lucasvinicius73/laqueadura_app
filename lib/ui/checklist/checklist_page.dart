import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:laqueadura_app/ui/checklist/pregnant_checklist_page.dart';
import 'package:laqueadura_app/ui/checklist/non_pregnant_checklist_page.dart';

class CheckListPage extends StatefulWidget {
  const CheckListPage({super.key});

  @override
  State<CheckListPage> createState() => _CheckListPageState();
}

class _CheckListPageState extends State<CheckListPage> {
  bool _isLoading = true;
  String? _savedChoice; // 'pregnant' ou 'non_pregnant'

  @override
  void initState() {
    super.initState();
    _loadSavedChoice();
  }

  Future<void> _loadSavedChoice() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final choice = prefs.getString('checklist_user_choice');
      if (mounted) {
        setState(() {
          _savedChoice = choice;
          _isLoading = false;
        });
      }
    } catch (_) {
      // Se SharedPreferences falhar, mostra a tela de pergunta normalmente
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> _saveChoice(String choice) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('checklist_user_choice', choice);
    } catch (_) {}
    if (mounted) {
      setState(() {
        _savedChoice = choice;
      });
    }
  }

  Future<void> _clearChoice() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('checklist_user_choice');
    } catch (_) {}
    if (mounted) {
      setState(() {
        _savedChoice = null;
      });
    }
  }

  void _navigateToChecklist(String choice) async {
    // Salva e espera completar antes de navegar
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('checklist_user_choice', choice);
    } catch (_) {}

    // Atualiza estado local
    _savedChoice = choice;

    if (!mounted) return;

    final page = choice == 'pregnant'
        ? const PregnantChecklistPage()
        : const NonPregnantChecklistPage();

    // Quando voltar da tela filha, recarrega o estado
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );

    // Recarrega ao voltar (o State ainda existe pois é rota nomeada)
    _loadSavedChoice();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return Scaffold(
        appBar: AppBar(title: const Text("CheckList")),
        body: const Center(
          child: CircularProgressIndicator(color: Color(0xffD8AEA2)),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("CheckList"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: _savedChoice != null
            ? _buildSavedChoiceView()
            : _buildQuestionView(),
      ),
    );
  }

  /// Tela quando já existe uma escolha salva — mostra resumo e acesso rápido
  Widget _buildSavedChoiceView() {
    final isPregnant = _savedChoice == 'pregnant';
    final color = isPregnant ? const Color(0xffD8AEA2) : const Color(0xFF607D8B);
    final label = isPregnant ? "Gestante" : "Não Gestante";
    final icon = isPregnant ? Icons.pregnant_woman : Icons.person;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ícone ilustrativo
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: color.withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: Icon(icon, size: 60, color: color),
        ),
        const SizedBox(height: 24),

        Text(
          "Checklist - $label",
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xff333333),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 12),

        Text(
          "Seus dados e cálculos estão salvos.\nContinue de onde parou!",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 40),

        // Botão principal — abrir o checklist
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
            onPressed: () => _navigateToChecklist(_savedChoice!),
            icon: const Icon(Icons.checklist_rtl, color: Colors.white),
            label: const Text(
              "Continuar Checklist",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              elevation: 2,
            ),
          ),
        ),
        const SizedBox(height: 16),

        // Botão secundário — preencher novamente
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: const Text("Preencher novamente?"),
                  content: const Text(
                    "Isso vai resetar a escolha de perfil (gestante/não gestante). "
                    "Os dados do checklist anterior continuarão salvos.",
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx),
                      child: const Text("Cancelar"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        _clearChoice();
                      },
                      child: const Text(
                        "Preencher novamente",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ],
                ),
              );
            },
            icon: Icon(Icons.refresh, color: color),
            label: Text(
              "Preencher novamente",
              style: TextStyle(fontSize: 16, color: color),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              side: BorderSide(color: color, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }

  /// Tela com a pergunta inicial "Você está gestante?"
  Widget _buildQuestionView() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Ícone ilustrativo
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            color: const Color(0xffD8AEA2).withOpacity(0.15),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.checklist_rtl,
            size: 60,
            color: Color(0xffD8AEA2),
          ),
        ),
        const SizedBox(height: 32),

        // Título
        const Text(
          "Cálculos & Lembretes",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xff333333),
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),

        // Descrição
        Text(
          "Para personalizar seu checklist e calcular prazos importantes, precisamos saber:",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade600,
            height: 1.5,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),

        // Pergunta
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.15),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              const Text(
                "Você está gestante?",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff333333),
                ),
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: _OptionButton(
                      icon: Icons.pregnant_woman,
                      label: "Sim",
                      color: const Color(0xffD8AEA2),
                      onTap: () => _navigateToChecklist('pregnant'),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _OptionButton(
                      icon: Icons.person,
                      label: "Não",
                      color: const Color(0xFF607D8B),
                      onTap: () => _navigateToChecklist('non_pregnant'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _OptionButton extends StatelessWidget {
  const _OptionButton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: color, width: 2),
          ),
          child: Column(
            children: [
              Icon(icon, size: 40, color: color),
              const SizedBox(height: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
