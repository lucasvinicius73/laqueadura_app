import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/checklist/checklist_view_model.dart';
import 'package:laqueadura_app/ui/checklist/widgets/checklist_item_widget.dart';
import 'package:laqueadura_app/ui/checklist/widgets/exam_item_widget.dart';

class NonPregnantChecklistPage extends StatefulWidget {
  const NonPregnantChecklistPage({super.key});

  @override
  State<NonPregnantChecklistPage> createState() =>
      _NonPregnantChecklistPageState();
}

class _NonPregnantChecklistPageState extends State<NonPregnantChecklistPage> {
  final ChecklistViewModel _viewModel = ChecklistViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checklist - Não Gestante"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_active),
            onPressed: _activateReminders,
            tooltip: "Ativar lembretes",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header informativo
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    const Color(0xFF607D8B),
                    const Color(0xFF607D8B).withOpacity(0.7),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.checklist,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Checklist de Preparação",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Complete todas as etapas para realizar a laqueadura",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Checklist
            const Text(
              "Consultas e Documentação",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),

            // Itens do checklist
            ..._viewModel.nonPregnantChecklist.map((item) {
              return ChecklistItemWidget(
                item: item,
                onDateChanged: (date) {
                  setState(() {
                    _viewModel.updateChecklistItem(
                      item.id,
                      date: date,
                      isPregnant: false,
                    );
                  });
                },
                onCompletedChanged: (completed) {
                  setState(() {
                    _viewModel.updateChecklistItem(
                      item.id,
                      completed: completed,
                      isPregnant: false,
                    );
                  });
                },
                onNotApplicableChanged: (notApplicable) {
                  setState(() {
                    _viewModel.updateChecklistItem(
                      item.id,
                      notApplicable: notApplicable,
                      isPregnant: false,
                    );
                  });
                },
              );
            }),

            const SizedBox(height: 24),

            // Seção de exames
            Row(
              children: [
                const Icon(
                  Icons.science,
                  color: Color(0xFF607D8B),
                ),
                const SizedBox(width: 8),
                const Text(
                  "Exames",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            if (_viewModel.nonPregnantExams.isEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.grey.shade300,
                    style: BorderStyle.solid,
                  ),
                ),
                child: Column(
                  children: [
                    Icon(
                      Icons.science_outlined,
                      size: 48,
                      color: Colors.grey.shade400,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Nenhum exame adicionado",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Toque no botão + para adicionar",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              )
            else
              ..._viewModel.nonPregnantExams.map((exam) {
                return ExamItemWidget(
                  exam: exam,
                  onNameChanged: (name) {
                    setState(() {
                      _viewModel.updateExam(
                        exam.id,
                        name: name,
                        isPregnant: false,
                      );
                    });
                  },
                  onDateChanged: (date) {
                    setState(() {
                      _viewModel.updateExam(
                        exam.id,
                        date: date,
                        isPregnant: false,
                      );
                    });
                  },
                  onValidityChanged: (validity) {
                    setState(() {
                      _viewModel.updateExam(
                        exam.id,
                        validity: validity,
                        isPregnant: false,
                      );
                    });
                  },
                  onCompletedChanged: (completed) {
                    setState(() {
                      _viewModel.updateExam(
                        exam.id,
                        completed: completed,
                        isPregnant: false,
                      );
                    });
                  },
                  onNotApplicableChanged: (notApplicable) {
                    setState(() {
                      _viewModel.updateExam(
                        exam.id,
                        notApplicable: notApplicable,
                        isPregnant: false,
                      );
                    });
                  },
                  onNotificationsChanged: (enabled) {
                    setState(() {
                      _viewModel.updateExam(
                        exam.id,
                        notifications: enabled,
                        isPregnant: false,
                      );
                    });
                  },
                  onRemove: () {
                    setState(() {
                      _viewModel.removeExam(exam.id, isPregnant: false);
                    });
                  },
                );
              }),

            const SizedBox(height: 24),

            // Seção de última autorização
            _buildLastAuthorizationSection(),

            const SizedBox(height: 100), // Espaço para o FAB
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            _viewModel.addExam(isPregnant: false);
          });
        },
        backgroundColor: const Color(0xFF607D8B),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Adicionar exame",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildLastAuthorizationSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.event_available, color: Colors.blue.shade700),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Data da última autorização",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            "Informe quando você obtiver a última autorização necessária para calcular quando poderá realizar a laqueadura.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.blue.shade600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 16),
          InkWell(
            onTap: () => _selectLastAuthorizationDate(),
            borderRadius: BorderRadius.circular(8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade300),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.blue.shade600,
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _viewModel.lastAuthorizationDate != null
                        ? DateFormat('dd/MM/yyyy')
                            .format(_viewModel.lastAuthorizationDate!)
                        : "Selecionar data",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: _viewModel.lastAuthorizationDate != null
                          ? Colors.blue.shade800
                          : Colors.blue.shade400,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Mostrar resultado se a data foi selecionada
          if (_viewModel.laqueaduraAvailableDate != null) ...[
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.green.shade400,
                    Colors.green.shade600,
                  ],
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                children: [
                  const Icon(
                    Icons.celebration,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Você pode realizar a laqueadura a partir de:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    DateFormat('dd/MM/yyyy')
                        .format(_viewModel.laqueaduraAvailableDate!),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      "Vá à regulação do seu município",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Future<void> _selectLastAuthorizationDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _viewModel.lastAuthorizationDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      locale: const Locale('pt', 'BR'),
      helpText: "Data da última autorização",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF607D8B),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _viewModel.setLastAuthorizationDate(picked);
      });
    }
  }

  void _activateReminders() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.notifications_active, color: Colors.white),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                "Lembretes ativados! Você será notificada nos prazos de vencimento.",
              ),
            ),
          ],
        ),
        backgroundColor: Colors.green.shade600,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

