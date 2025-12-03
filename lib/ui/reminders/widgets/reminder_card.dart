import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/reminders/reminders_view_model.dart';

class ReminderCard extends StatelessWidget {
  const ReminderCard({
    super.key,
    required this.reminder,
    required this.onEdit,
    required this.onDelete,
    required this.onToggleNotification,
  });

  final Reminder reminder;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onToggleNotification;

  @override
  Widget build(BuildContext context) {
    final isPast = reminder.isPast && !reminder.isToday;
    final isUrgent = reminder.isToday || reminder.isTomorrow;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: isPast ? Colors.grey.shade100 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: isUrgent
              ? reminder.type.color
              : isPast
                  ? Colors.grey.shade300
                  : Colors.grey.shade200,
          width: isUrgent ? 2 : 1,
        ),
        boxShadow: isPast
            ? null
            : [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: onEdit,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Data no lado esquerdo
                Container(
                  width: 56,
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: reminder.type.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        DateFormat('dd').format(reminder.date),
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: isPast
                              ? Colors.grey
                              : reminder.type.color,
                        ),
                      ),
                      Text(
                        DateFormat('MMM', 'pt_BR')
                            .format(reminder.date)
                            .toUpperCase(),
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: isPast
                              ? Colors.grey
                              : reminder.type.color,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 14),

                // Conteúdo principal
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Badge de tipo e urgência
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: reminder.type.color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  reminder.type.icon,
                                  size: 14,
                                  color: reminder.type.color,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  reminder.type.label,
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                    color: reminder.type.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (reminder.urgencyText != null) ...[
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: _getUrgencyColor(),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Text(
                                reminder.urgencyText!,
                                style: const TextStyle(
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ],
                      ),
                      const SizedBox(height: 8),

                      // Título
                      Text(
                        reminder.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isPast
                              ? Colors.grey.shade500
                              : Colors.grey.shade800,
                          decoration:
                              isPast ? TextDecoration.lineThrough : null,
                        ),
                      ),

                      // Horário e repetição
                      if (reminder.formattedTime != null ||
                          reminder.repetition != ReminderRepetition.once) ...[
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            if (reminder.formattedTime != null) ...[
                              Icon(
                                Icons.access_time,
                                size: 14,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                reminder.formattedTime!,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                            if (reminder.repetition !=
                                ReminderRepetition.once) ...[
                              const SizedBox(width: 12),
                              Icon(
                                Icons.repeat,
                                size: 14,
                                color: Colors.grey.shade500,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                reminder.repetition.label,
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],

                      // Notas
                      if (reminder.notes != null &&
                          reminder.notes!.isNotEmpty) ...[
                        const SizedBox(height: 6),
                        Text(
                          reminder.notes!,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey.shade500,
                            fontStyle: FontStyle.italic,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),

                // Ações
                Column(
                  children: [
                    // Toggle notificação
                    IconButton(
                      icon: Icon(
                        reminder.notificationEnabled
                            ? Icons.notifications_active
                            : Icons.notifications_off,
                        size: 20,
                      ),
                      color: reminder.notificationEnabled
                          ? const Color(0xffD8AEA2)
                          : Colors.grey.shade400,
                      onPressed: onToggleNotification,
                      tooltip: reminder.notificationEnabled
                          ? "Desativar notificação"
                          : "Ativar notificação",
                    ),
                    // Menu de ações
                    PopupMenuButton<String>(
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.grey.shade400,
                        size: 20,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      onSelected: (value) {
                        if (value == 'edit') {
                          onEdit();
                        } else if (value == 'delete') {
                          onDelete();
                        }
                      },
                      itemBuilder: (context) => [
                        const PopupMenuItem(
                          value: 'edit',
                          child: Row(
                            children: [
                              Icon(Icons.edit, size: 20),
                              SizedBox(width: 8),
                              Text('Editar'),
                            ],
                          ),
                        ),
                        PopupMenuItem(
                          value: 'delete',
                          child: Row(
                            children: [
                              Icon(Icons.delete, size: 20, color: Colors.red),
                              const SizedBox(width: 8),
                              const Text(
                                'Excluir',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Color _getUrgencyColor() {
    if (reminder.isPast) return Colors.grey;
    if (reminder.isToday) return Colors.red;
    if (reminder.isTomorrow) return Colors.orange;
    return Colors.blue;
  }
}

