import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/checklist/checklist_view_model.dart';

class ExamItemWidget extends StatelessWidget {
  const ExamItemWidget({
    super.key,
    required this.exam,
    required this.onNameChanged,
    required this.onDateChanged,
    required this.onValidityChanged,
    required this.onCompletedChanged,
    required this.onNotApplicableChanged,
    required this.onNotificationsChanged,
    required this.onRemove,
  });

  final ExamItem exam;
  final Function(String) onNameChanged;
  final Function(DateTime?) onDateChanged;
  final Function(ExamValidity) onValidityChanged;
  final Function(bool) onCompletedChanged;
  final Function(bool) onNotApplicableChanged;
  final Function(bool) onNotificationsChanged;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final isDisabled = exam.notApplicable;
    final isExpired = exam.isExpired && !isDisabled && exam.datePerformed != null;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: isDisabled ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isExpired
              ? Colors.red.shade300
              : exam.isCompleted
                  ? Colors.green.shade300
                  : isDisabled
                      ? Colors.grey.shade300
                      : Colors.grey.shade200,
          width: (isExpired || exam.isCompleted) ? 2 : 1,
        ),
        boxShadow: isDisabled
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header com botão de remover
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: isExpired
                  ? Colors.red.shade50
                  : exam.isCompleted
                      ? Colors.green.shade50
                      : const Color(0xffD8AEA2).withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(11),
                topRight: Radius.circular(11),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.science_outlined,
                  color: isExpired
                      ? Colors.red.shade600
                      : exam.isCompleted
                          ? Colors.green.shade600
                          : const Color(0xffD8AEA2),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Exame",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                    color: Colors.red.shade400,
                  ),
                  onPressed: () => _confirmRemove(context),
                  tooltip: "Remover exame",
                ),
              ],
            ),
          ),

          // Alerta de exame vencido
          if (isExpired)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              color: Colors.red.shade50,
              child: Row(
                children: [
                  Icon(Icons.warning_amber, color: Colors.red.shade700),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "O exame ${exam.name.isNotEmpty ? '"${exam.name}"' : ''} está vencido desde ${DateFormat('dd/MM/yyyy').format(exam.expirationDate!)}. Refaça para manter sua documentação atualizada.",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.red.shade700,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nome do exame
                if (!isDisabled) ...[
                  TextField(
                    decoration: InputDecoration(
                      labelText: "Nome do exame",
                      hintText: "Ex: Hemograma, Ultrassom...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                    ),
                    onChanged: onNameChanged,
                    controller: TextEditingController(text: exam.name)
                      ..selection = TextSelection.fromPosition(
                        TextPosition(offset: exam.name.length),
                      ),
                  ),
                  const SizedBox(height: 12),

                  // Data realizada
                  InkWell(
                    onTap: () => _selectDate(context),
                    borderRadius: BorderRadius.circular(8),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: 18,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            exam.datePerformed != null
                                ? "Data realizada: ${DateFormat('dd/MM/yyyy').format(exam.datePerformed!)}"
                                : "Data realizada: __/__/____",
                            style: TextStyle(
                              fontSize: 14,
                              color: exam.datePerformed != null
                                  ? Colors.grey.shade800
                                  : Colors.grey.shade500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Validade
                  const Text(
                    "Validade:",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: ExamValidity.values.map((validity) {
                      final isSelected = exam.validity == validity;
                      return ChoiceChip(
                        label: Text(validity.label),
                        selected: isSelected,
                        onSelected: (selected) {
                          if (selected) onValidityChanged(validity);
                        },
                        selectedColor: const Color(0xffD8AEA2).withOpacity(0.3),
                        labelStyle: TextStyle(
                          color: isSelected
                              ? const Color(0xffD8AEA2)
                              : Colors.grey.shade700,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 12),

                  // Data de vencimento calculada
                  if (exam.expirationDate != null)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isExpired
                            ? Colors.red.shade50
                            : Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            isExpired ? Icons.warning : Icons.info_outline,
                            size: 18,
                            color: isExpired
                                ? Colors.red.shade700
                                : Colors.blue.shade700,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            "Vencimento: ${DateFormat('dd/MM/yyyy').format(exam.expirationDate!)}",
                            style: TextStyle(
                              fontSize: 14,
                              color: isExpired
                                  ? Colors.red.shade700
                                  : Colors.blue.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  const SizedBox(height: 12),

                  // Notificações
                  Row(
                    children: [
                      Switch(
                        value: exam.notificationsEnabled,
                        onChanged: onNotificationsChanged,
                        activeColor: const Color(0xffD8AEA2),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          "Ativar lembretes de vencimento",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                ],

                // Botões de ação
                Row(
                  children: [
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.check,
                        label: "Concluído",
                        isActive: exam.isCompleted,
                        activeColor: Colors.green,
                        onTap: isDisabled
                            ? null
                            : () => onCompletedChanged(!exam.isCompleted),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: _ActionButton(
                        icon: Icons.block,
                        label: "Não se aplica",
                        isActive: exam.notApplicable,
                        activeColor: Colors.grey,
                        onTap: () => _confirmNotApplicable(context),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: exam.datePerformed ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      locale: const Locale('pt', 'BR'),
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
      onDateChanged(picked);
    }
  }

  Future<void> _confirmNotApplicable(BuildContext context) async {
    if (exam.notApplicable) {
      onNotApplicableChanged(false);
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Confirmar"),
        content: const Text(
          'Tem certeza que este exame não se aplica ao seu caso?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffD8AEA2),
              foregroundColor: Colors.white,
            ),
            child: const Text("Confirmar"),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      onNotApplicableChanged(true);
    }
  }

  Future<void> _confirmRemove(BuildContext context) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Remover exame"),
        content: Text(
          'Deseja remover ${exam.name.isNotEmpty ? '"${exam.name}"' : 'este exame'}?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(context, true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text("Remover"),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      onRemove();
    }
  }
}

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.activeColor,
    this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final Color activeColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          decoration: BoxDecoration(
            color: isActive ? activeColor.withOpacity(0.15) : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: isActive ? activeColor : Colors.grey.shade300,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 18,
                color: isActive ? activeColor : Colors.grey.shade500,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive ? activeColor : Colors.grey.shade600,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

