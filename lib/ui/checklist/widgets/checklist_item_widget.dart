import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/checklist/checklist_view_model.dart';

class ChecklistItemWidget extends StatelessWidget {
  const ChecklistItemWidget({
    super.key,
    required this.item,
    required this.onDateChanged,
    required this.onCompletedChanged,
    required this.onNotApplicableChanged,
  });

  final ChecklistItem item;
  final Function(DateTime?) onDateChanged;
  final Function(bool) onCompletedChanged;
  final Function(bool) onNotApplicableChanged;

  @override
  Widget build(BuildContext context) {
    final isDisabled = item.notApplicable;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDisabled ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: item.isCompleted
              ? Colors.green.shade300
              : isDisabled
                  ? Colors.grey.shade300
                  : Colors.grey.shade200,
          width: item.isCompleted ? 2 : 1,
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
          // Título
          Row(
            children: [
              if (item.isCompleted)
                Icon(
                  Icons.check_circle,
                  color: Colors.green.shade600,
                  size: 24,
                )
              else if (isDisabled)
                Icon(
                  Icons.block,
                  color: Colors.grey.shade400,
                  size: 24,
                )
              else
                Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey.shade400,
                  size: 24,
                ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  item.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: isDisabled ? Colors.grey.shade500 : Colors.grey.shade800,
                    decoration: isDisabled ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Campo de data
          if (!isDisabled) ...[
            InkWell(
              onTap: () => _selectDate(context),
              borderRadius: BorderRadius.circular(8),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey.shade300),
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
                      item.datePerformed != null
                          ? "Data realizada: ${DateFormat('dd/MM/yyyy').format(item.datePerformed!)}"
                          : "Data realizada: __/__/____",
                      style: TextStyle(
                        fontSize: 14,
                        color: item.datePerformed != null
                            ? Colors.grey.shade800
                            : Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
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
                  isActive: item.isCompleted,
                  activeColor: Colors.green,
                  onTap: isDisabled
                      ? null
                      : () => onCompletedChanged(!item.isCompleted),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _ActionButton(
                  icon: Icons.block,
                  label: "Não se aplica",
                  isActive: item.notApplicable,
                  activeColor: Colors.grey,
                  onTap: () => _confirmNotApplicable(context),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: item.datePerformed ?? DateTime.now(),
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
    if (item.notApplicable) {
      // Se já está marcado, desmarcar
      onNotApplicableChanged(false);
      return;
    }

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Confirmar"),
        content: Text(
          'Tem certeza que "${item.title}" não se aplica ao seu caso?',
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
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
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

