import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum ReminderType {
  consultation,
  exam,
  deadline,
  medication,
  other,
}

extension ReminderTypeExtension on ReminderType {
  String get label {
    switch (this) {
      case ReminderType.consultation:
        return 'Consulta';
      case ReminderType.exam:
        return 'Exame';
      case ReminderType.deadline:
        return 'Prazo';
      case ReminderType.medication:
        return 'Medicamento';
      case ReminderType.other:
        return 'Outro';
    }
  }

  IconData get icon {
    switch (this) {
      case ReminderType.consultation:
        return Icons.medical_services;
      case ReminderType.exam:
        return Icons.science;
      case ReminderType.deadline:
        return Icons.event_busy;
      case ReminderType.medication:
        return Icons.medication;
      case ReminderType.other:
        return Icons.event_note;
    }
  }

  Color get color {
    switch (this) {
      case ReminderType.consultation:
        return Colors.blue;
      case ReminderType.exam:
        return Colors.purple;
      case ReminderType.deadline:
        return Colors.red;
      case ReminderType.medication:
        return Colors.green;
      case ReminderType.other:
        return Colors.orange;
    }
  }
}

enum ReminderRepetition {
  once,
  weekly,
  monthly,
}

extension ReminderRepetitionExtension on ReminderRepetition {
  String get label {
    switch (this) {
      case ReminderRepetition.once:
        return 'Único';
      case ReminderRepetition.weekly:
        return 'Semanal';
      case ReminderRepetition.monthly:
        return 'Mensal';
    }
  }
}

class Reminder {
  final String id;
  String title;
  DateTime date;
  TimeOfDay? time;
  ReminderType type;
  ReminderRepetition repetition;
  bool notificationEnabled;
  String? notes;

  Reminder({
    required this.id,
    required this.title,
    required this.date,
    this.time,
    this.type = ReminderType.other,
    this.repetition = ReminderRepetition.once,
    this.notificationEnabled = true,
    this.notes,
  });

  /// Verifica se o lembrete é hoje
  bool get isToday {
    final now = DateTime.now();
    return date.year == now.year &&
        date.month == now.month &&
        date.day == now.day;
  }

  /// Verifica se o lembrete é amanhã
  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return date.year == tomorrow.year &&
        date.month == tomorrow.month &&
        date.day == tomorrow.day;
  }

  /// Verifica se o lembrete já passou
  bool get isPast {
    final now = DateTime.now();
    final reminderDateTime = DateTime(
      date.year,
      date.month,
      date.day,
      time?.hour ?? 23,
      time?.minute ?? 59,
    );
    return reminderDateTime.isBefore(now);
  }

  /// Dias até o lembrete
  int get daysUntil {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final reminderDate = DateTime(date.year, date.month, date.day);
    return reminderDate.difference(today).inDays;
  }

  /// Formata a data para exibição
  String get formattedDate {
    if (isToday) return "Hoje";
    if (isTomorrow) return "Amanhã";
    return DateFormat('dd/MM/yyyy').format(date);
  }

  /// Formata o horário para exibição
  String? get formattedTime {
    if (time == null) return null;
    final hour = time!.hour.toString().padLeft(2, '0');
    final minute = time!.minute.toString().padLeft(2, '0');
    return "$hour:$minute";
  }

  /// Texto de urgência
  String? get urgencyText {
    if (isPast) return "Passou";
    if (isToday) return "Hoje!";
    if (isTomorrow) return "Amanhã";
    if (daysUntil <= 7) return "Em $daysUntil dias";
    return null;
  }
}

class RemindersViewModel extends ChangeNotifier {
  List<Reminder> _reminders = [];

  List<Reminder> get reminders {
    // Ordena por data
    _reminders.sort((a, b) => a.date.compareTo(b.date));
    return _reminders;
  }

  int get upcomingRemindersCount {
    final now = DateTime.now();
    return _reminders.where((r) {
      return !r.isPast || r.isToday;
    }).length;
  }

  /// Adiciona lembretes de exemplo
  void addSampleReminders() {
    final now = DateTime.now();
    
    _reminders = [
      Reminder(
        id: '1',
        title: 'Consulta de pré-natal',
        date: DateTime(now.year, now.month, now.day + 5),
        time: const TimeOfDay(hour: 14, minute: 30),
        type: ReminderType.consultation,
      ),
      Reminder(
        id: '2',
        title: 'Exame de ultrassom',
        date: DateTime(now.year, now.month, now.day + 12),
        time: const TimeOfDay(hour: 9, minute: 0),
        type: ReminderType.exam,
      ),
      Reminder(
        id: '3',
        title: 'Data limite para autorizações da laqueadura',
        date: DateTime(now.year, now.month + 2, 7),
        type: ReminderType.deadline,
        notes: 'Lembre-se de reunir todos os documentos necessários.',
      ),
      Reminder(
        id: '4',
        title: 'Consulta com psicólogo',
        date: DateTime(now.year, now.month, now.day + 20),
        time: const TimeOfDay(hour: 10, minute: 0),
        type: ReminderType.consultation,
      ),
      Reminder(
        id: '5',
        title: 'Exame de sangue',
        date: DateTime(now.year, now.month, now.day + 3),
        time: const TimeOfDay(hour: 7, minute: 30),
        type: ReminderType.exam,
        notes: 'Jejum de 12 horas',
      ),
    ];
    notifyListeners();
  }

  /// Agrupa lembretes por mês
  Map<String, List<Reminder>> getRemindersByMonth() {
    final Map<String, List<Reminder>> grouped = {};

    for (final reminder in reminders) {
      final monthYear = DateFormat('MMMM yyyy', 'pt_BR').format(reminder.date);
      final capitalizedMonth =
          monthYear[0].toUpperCase() + monthYear.substring(1);

      if (!grouped.containsKey(capitalizedMonth)) {
        grouped[capitalizedMonth] = [];
      }
      grouped[capitalizedMonth]!.add(reminder);
    }

    return grouped;
  }

  void addReminder(Reminder reminder) {
    _reminders.add(reminder);
    notifyListeners();
  }

  void updateReminder(Reminder reminder) {
    final index = _reminders.indexWhere((r) => r.id == reminder.id);
    if (index != -1) {
      _reminders[index] = reminder;
      notifyListeners();
    }
  }

  void removeReminder(String id) {
    _reminders.removeWhere((r) => r.id == id);
    notifyListeners();
  }

  void toggleNotification(String id) {
    final index = _reminders.indexWhere((r) => r.id == id);
    if (index != -1) {
      _reminders[index].notificationEnabled =
          !_reminders[index].notificationEnabled;
      notifyListeners();
    }
  }
}

