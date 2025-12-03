import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/reminders/reminders_view_model.dart';
import 'package:laqueadura_app/ui/reminders/widgets/reminder_card.dart';
import 'package:laqueadura_app/ui/reminders/widgets/reminder_form_dialog.dart';

class RemindersPage extends StatefulWidget {
  const RemindersPage({super.key});

  @override
  State<RemindersPage> createState() => _RemindersPageState();
}

class _RemindersPageState extends State<RemindersPage> {
  final RemindersViewModel _viewModel = RemindersViewModel();

  @override
  void initState() {
    super.initState();
    // Adiciona alguns lembretes de exemplo
    _viewModel.addSampleReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Meus Lembretes"),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterOptions,
            tooltip: "Filtrar",
          ),
        ],
      ),
      body: Column(
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
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.notifications_active,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _getGreeting(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.9),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "${_viewModel.upcomingRemindersCount} lembretes próximos",
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  "Agende suas consultas, exames e prazos importantes. O app vai lembrar você na data certa.",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.95),
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),

          // Lista de lembretes
          Expanded(
            child: _viewModel.reminders.isEmpty
                ? _buildEmptyState()
                : _buildRemindersList(),
          ),

          // Dica no rodapé
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.amber.shade50,
              border: Border(
                top: BorderSide(color: Colors.amber.shade200),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: Colors.amber.shade700,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "Organize suas consultas e prazos importantes. Assim, você garante tranquilidade durante todo o processo.",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.amber.shade800,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showAddReminderDialog(),
        backgroundColor: const Color(0xffD8AEA2),
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text(
          "Novo lembrete",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.event_note,
                size: 64,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              "Nenhum lembrete ainda",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Toque no botão abaixo para adicionar seu primeiro lembrete",
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey.shade500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRemindersList() {
    // Agrupa lembretes por mês
    final groupedReminders = _viewModel.getRemindersByMonth();

    return ListView.builder(
      padding: const EdgeInsets.only(top: 16, bottom: 100),
      itemCount: groupedReminders.length,
      itemBuilder: (context, index) {
        final monthYear = groupedReminders.keys.elementAt(index);
        final reminders = groupedReminders[monthYear]!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header do mês
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xffD8AEA2).withOpacity(0.15),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      monthYear,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffD8AEA2),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "${reminders.length} ${reminders.length == 1 ? 'lembrete' : 'lembretes'}",
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
            ),

            // Lista de lembretes do mês
            ...reminders.map((reminder) {
              return ReminderCard(
                reminder: reminder,
                onEdit: () => _showEditReminderDialog(reminder),
                onDelete: () => _confirmDelete(reminder),
                onToggleNotification: () {
                  setState(() {
                    _viewModel.toggleNotification(reminder.id);
                  });
                },
              );
            }),

            const SizedBox(height: 8),
          ],
        );
      },
    );
  }

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return "Bom dia! ☀️";
    if (hour < 18) return "Boa tarde! 🌤️";
    return "Boa noite! 🌙";
  }

  void _showFilterOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Filtrar lembretes",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            _buildFilterOption(
              icon: Icons.calendar_today,
              label: "Todos os lembretes",
              isSelected: true,
            ),
            _buildFilterOption(
              icon: Icons.upcoming,
              label: "Próximos 7 dias",
              isSelected: false,
            ),
            _buildFilterOption(
              icon: Icons.event,
              label: "Este mês",
              isSelected: false,
            ),
            _buildFilterOption(
              icon: Icons.medical_services,
              label: "Consultas",
              isSelected: false,
            ),
            _buildFilterOption(
              icon: Icons.science,
              label: "Exames",
              isSelected: false,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterOption({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isSelected ? const Color(0xffD8AEA2) : Colors.grey.shade600,
      ),
      title: Text(
        label,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? const Color(0xffD8AEA2) : Colors.grey.shade800,
        ),
      ),
      trailing: isSelected
          ? const Icon(Icons.check, color: Color(0xffD8AEA2))
          : null,
      onTap: () {
        Navigator.pop(context);
      },
    );
  }

  void _showAddReminderDialog() {
    showDialog(
      context: context,
      builder: (context) => ReminderFormDialog(
        onSave: (reminder) {
          setState(() {
            _viewModel.addReminder(reminder);
          });
          _showSnackBar("Lembrete adicionado com sucesso!");
        },
      ),
    );
  }

  void _showEditReminderDialog(Reminder reminder) {
    showDialog(
      context: context,
      builder: (context) => ReminderFormDialog(
        reminder: reminder,
        onSave: (updatedReminder) {
          setState(() {
            _viewModel.updateReminder(updatedReminder);
          });
          _showSnackBar("Lembrete atualizado!");
        },
      ),
    );
  }

  void _confirmDelete(Reminder reminder) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text("Excluir lembrete"),
        content: Text(
          'Deseja excluir o lembrete "${reminder.title}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _viewModel.removeReminder(reminder.id);
              });
              _showSnackBar("Lembrete excluído");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text("Excluir"),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}

