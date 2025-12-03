import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/checklist/checklist_view_model.dart';
import 'package:laqueadura_app/ui/checklist/widgets/checklist_item_widget.dart';
import 'package:laqueadura_app/ui/checklist/widgets/exam_item_widget.dart';
import 'package:laqueadura_app/ui/checklist/widgets/pregnancy_info_card.dart';

class PregnantChecklistPage extends StatefulWidget {
  const PregnantChecklistPage({super.key});

  @override
  State<PregnantChecklistPage> createState() => _PregnantChecklistPageState();
}

class _PregnantChecklistPageState extends State<PregnantChecklistPage> {
  final ChecklistViewModel _viewModel = ChecklistViewModel();
  bool _showDumPicker = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Checklist - Gestante"),
        actions: [
          if (_viewModel.calculator != null)
            IconButton(
              icon: const Icon(Icons.notifications_active),
              onPressed: _activateReminders,
              tooltip: "Ativar lembretes",
            ),
        ],
      ),
      body: _showDumPicker ? _buildDumPicker() : _buildChecklist(),
      floatingActionButton: !_showDumPicker
          ? FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _viewModel.addExam(isPregnant: true);
                });
              },
              backgroundColor: const Color(0xffD8AEA2),
              icon: const Icon(Icons.add, color: Colors.white),
              label: const Text(
                "Adicionar exame",
                style: TextStyle(color: Colors.white),
              ),
            )
          : null,
    );
  }

  Widget _buildDumPicker() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xffD8AEA2).withOpacity(0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.calendar_month,
              size: 50,
              color: Color(0xffD8AEA2),
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            "Informe a Data da Última Menstruação (DUM)",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            "Com essa informação, calcularemos automaticamente a data provável do parto, idade gestacional e prazos importantes.",
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () => _selectDum(),
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xffD8AEA2)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.calendar_today,
                          color: Color(0xffD8AEA2),
                        ),
                        const SizedBox(width: 12),
                        Text(
                          _viewModel.dum != null
                              ? DateFormat('dd/MM/yyyy').format(_viewModel.dum!)
                              : "Selecionar data",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: _viewModel.dum != null
                                ? Colors.grey.shade800
                                : Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _viewModel.dum != null
                        ? () {
                            setState(() {
                              _showDumPicker = false;
                            });
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffD8AEA2),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Calcular e continuar",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChecklist() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card com informações da gestação
          if (_viewModel.calculator != null)
            PregnancyInfoCard(
              calculator: _viewModel.calculator!,
              onEditDum: () {
                setState(() {
                  _showDumPicker = true;
                });
              },
            ),
          const SizedBox(height: 24),

          // Avisos importantes
          _buildWarningsCard(),
          const SizedBox(height: 24),

          // Checklist
          const Text(
            "CheckList - Gestante",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Itens do checklist
          ..._viewModel.pregnantChecklist.map((item) {
            return ChecklistItemWidget(
              item: item,
              onDateChanged: (date) {
                setState(() {
                  _viewModel.updateChecklistItem(
                    item.id,
                    date: date,
                    isPregnant: true,
                  );
                });
              },
              onCompletedChanged: (completed) {
                setState(() {
                  _viewModel.updateChecklistItem(
                    item.id,
                    completed: completed,
                    isPregnant: true,
                  );
                });
              },
              onNotApplicableChanged: (notApplicable) {
                setState(() {
                  _viewModel.updateChecklistItem(
                    item.id,
                    notApplicable: notApplicable,
                    isPregnant: true,
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
                color: Color(0xffD8AEA2),
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

          if (_viewModel.pregnantExams.isEmpty)
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
            ..._viewModel.pregnantExams.map((exam) {
              return ExamItemWidget(
                exam: exam,
                onNameChanged: (name) {
                  setState(() {
                    _viewModel.updateExam(
                      exam.id,
                      name: name,
                      isPregnant: true,
                    );
                  });
                },
                onDateChanged: (date) {
                  setState(() {
                    _viewModel.updateExam(
                      exam.id,
                      date: date,
                      isPregnant: true,
                    );
                  });
                },
                onValidityChanged: (validity) {
                  setState(() {
                    _viewModel.updateExam(
                      exam.id,
                      validity: validity,
                      isPregnant: true,
                    );
                  });
                },
                onCompletedChanged: (completed) {
                  setState(() {
                    _viewModel.updateExam(
                      exam.id,
                      completed: completed,
                      isPregnant: true,
                    );
                  });
                },
                onNotApplicableChanged: (notApplicable) {
                  setState(() {
                    _viewModel.updateExam(
                      exam.id,
                      notApplicable: notApplicable,
                      isPregnant: true,
                    );
                  });
                },
                onNotificationsChanged: (enabled) {
                  setState(() {
                    _viewModel.updateExam(
                      exam.id,
                      notifications: enabled,
                      isPregnant: true,
                    );
                  });
                },
                onRemove: () {
                  setState(() {
                    _viewModel.removeExam(exam.id, isPregnant: true);
                  });
                },
              );
            }),

          const SizedBox(height: 100), // Espaço para o FAB
        ],
      ),
    );
  }

  Widget _buildWarningsCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.amber.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.info_outline, color: Colors.amber.shade700),
              const SizedBox(width: 8),
              Text(
                "Avisos importantes",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildWarningItem(
            "Essas datas são estimativas e podem variar conforme o pré-natal.",
          ),
          const SizedBox(height: 8),
          _buildWarningItem(
            "Todas as autorizações devem ser obtidas com pelo menos 60 dias de antecedência da Data do Parto.",
          ),
          const SizedBox(height: 8),
          _buildWarningItem(
            "É proibido realizar cesariana apenas para fazer a laqueadura. O tipo de parto segue critérios médicos.",
          ),
        ],
      ),
    );
  }

  Widget _buildWarningItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "• ",
          style: TextStyle(
            fontSize: 14,
            color: Colors.amber.shade800,
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14,
              color: Colors.amber.shade800,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDum() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _viewModel.dum ?? DateTime.now().subtract(const Duration(days: 60)),
      firstDate: DateTime.now().subtract(const Duration(days: 300)),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
      helpText: "Selecione a DUM",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xffD8AEA2),
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        _viewModel.setDum(picked);
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
                "Lembretes ativados! Você será notificada nos prazos importantes.",
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

