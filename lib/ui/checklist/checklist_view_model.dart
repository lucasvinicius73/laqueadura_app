import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Modelo para item de exame
class ExamItem {
  String id;
  String name;
  DateTime? datePerformed;
  ExamValidity validity;
  bool isCompleted;
  bool notApplicable;
  bool notificationsEnabled;

  ExamItem({
    required this.id,
    this.name = '',
    this.datePerformed,
    this.validity = ExamValidity.threeMonths,
    this.isCompleted = false,
    this.notApplicable = false,
    this.notificationsEnabled = true,
  });

  /// Calcula a data de vencimento do exame
  DateTime? get expirationDate {
    if (datePerformed == null) return null;
    switch (validity) {
      case ExamValidity.oneMonth:
        return DateTime(
          datePerformed!.year,
          datePerformed!.month + 1,
          datePerformed!.day,
        );
      case ExamValidity.threeMonths:
        return DateTime(
          datePerformed!.year,
          datePerformed!.month + 3,
          datePerformed!.day,
        );
      case ExamValidity.sixMonths:
        return DateTime(
          datePerformed!.year,
          datePerformed!.month + 6,
          datePerformed!.day,
        );
      case ExamValidity.oneYear:
        return DateTime(
          datePerformed!.year + 1,
          datePerformed!.month,
          datePerformed!.day,
        );
      case ExamValidity.threeYears:
        return DateTime(
          datePerformed!.year + 3,
          datePerformed!.month,
          datePerformed!.day,
        );
    }
  }

  /// Verifica se o exame está vencido
  bool get isExpired {
    if (expirationDate == null) return false;
    return DateTime.now().isAfter(expirationDate!);
  }

  /// Dias até o vencimento (negativo se vencido)
  int get daysUntilExpiration {
    if (expirationDate == null) return 0;
    return expirationDate!.difference(DateTime.now()).inDays;
  }
}

enum ExamValidity {
  oneMonth,
  threeMonths,
  sixMonths,
  oneYear,
  threeYears,
}

extension ExamValidityExtension on ExamValidity {
  String get label {
    switch (this) {
      case ExamValidity.oneMonth:
        return '1 mês';
      case ExamValidity.threeMonths:
        return '3 meses';
      case ExamValidity.sixMonths:
        return '6 meses';
      case ExamValidity.oneYear:
        return '1 ano';
      case ExamValidity.threeYears:
        return '3 anos';
    }
  }
}

/// Modelo para item de checklist
class ChecklistItem {
  String id;
  String title;
  DateTime? datePerformed;
  bool isCompleted;
  bool notApplicable;

  ChecklistItem({
    required this.id,
    required this.title,
    this.datePerformed,
    this.isCompleted = false,
    this.notApplicable = false,
  });
}

/// ViewModel para cálculos de gestação
class PregnancyCalculator {
  final DateTime dum;

  PregnancyCalculator(this.dum);

  /// Calcula a Data Provável do Parto (Regra de Naegele)
  /// DPP = DUM + 7 dias – 3 meses + 1 ano
  DateTime get dpp {
    return DateTime(
      dum.year + 1,
      dum.month - 3,
      dum.day + 7,
    );
  }

  /// Data limite para autorizações (DPP - 60 dias)
  DateTime get authorizationDeadline {
    return dpp.subtract(const Duration(days: 60));
  }

  /// Calcula a Idade Gestacional
  GestationalAge get gestationalAge {
    final today = DateTime.now();
    final difference = today.difference(dum).inDays;
    final weeks = difference ~/ 7;
    final days = difference % 7;
    return GestationalAge(weeks: weeks, days: days);
  }

  /// Verifica se o prazo de autorização já passou
  bool get isDeadlinePassed {
    return DateTime.now().isAfter(authorizationDeadline);
  }

  /// Dias até o prazo de autorização
  int get daysUntilDeadline {
    return authorizationDeadline.difference(DateTime.now()).inDays;
  }

  /// Formata data no padrão brasileiro
  static String formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy').format(date);
  }
}

class GestationalAge {
  final int weeks;
  final int days;

  GestationalAge({required this.weeks, required this.days});

  @override
  String toString() {
    if (weeks == 1) {
      if (days == 1) {
        return '$weeks semana e $days dia';
      }
      return '$weeks semana e $days dias';
    }
    if (days == 1) {
      return '$weeks semanas e $days dia';
    }
    return '$weeks semanas e $days dias';
  }
}

/// ViewModel principal do Checklist
class ChecklistViewModel extends ChangeNotifier {
  DateTime? _dum;
  PregnancyCalculator? _calculator;
  
  // Checklists para gestante
  List<ChecklistItem> pregnantChecklist = [
    ChecklistItem(id: 'prenatal', title: 'Pré-natal'),
    ChecklistItem(id: 'social_worker', title: 'Consulta com assistente social'),
    ChecklistItem(id: 'psychologist', title: 'Consulta com psicólogo'),
  ];
  
  List<ExamItem> pregnantExams = [];

  // Checklists para não gestante
  List<ChecklistItem> nonPregnantChecklist = [
    ChecklistItem(id: 'health_unit', title: 'Consulta na unidade de saúde'),
    ChecklistItem(id: 'social_worker', title: 'Consulta com assistente social'),
    ChecklistItem(id: 'psychologist', title: 'Consulta com psicólogo'),
    ChecklistItem(id: 'gynecologist', title: 'Consulta com ginecologista'),
  ];
  
  List<ExamItem> nonPregnantExams = [];
  
  DateTime? _lastAuthorizationDate;

  DateTime? get dum => _dum;
  PregnancyCalculator? get calculator => _calculator;
  DateTime? get lastAuthorizationDate => _lastAuthorizationDate;

  /// Data da laqueadura disponível (última autorização + 60 dias)
  DateTime? get laqueaduraAvailableDate {
    if (_lastAuthorizationDate == null) return null;
    return _lastAuthorizationDate!.add(const Duration(days: 60));
  }

  void setDum(DateTime date) {
    _dum = date;
    _calculator = PregnancyCalculator(date);
    notifyListeners();
  }

  void setLastAuthorizationDate(DateTime date) {
    _lastAuthorizationDate = date;
    notifyListeners();
  }

  void updateChecklistItem(String id, {DateTime? date, bool? completed, bool? notApplicable, bool isPregnant = true}) {
    final list = isPregnant ? pregnantChecklist : nonPregnantChecklist;
    final index = list.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (date != null) list[index].datePerformed = date;
      if (completed != null) list[index].isCompleted = completed;
      if (notApplicable != null) list[index].notApplicable = notApplicable;
      notifyListeners();
    }
  }

  void addExam({required bool isPregnant}) {
    final exams = isPregnant ? pregnantExams : nonPregnantExams;
    exams.add(ExamItem(id: DateTime.now().millisecondsSinceEpoch.toString()));
    notifyListeners();
  }

  void updateExam(String id, {
    String? name,
    DateTime? date,
    ExamValidity? validity,
    bool? completed,
    bool? notApplicable,
    bool? notifications,
    required bool isPregnant,
  }) {
    final exams = isPregnant ? pregnantExams : nonPregnantExams;
    final index = exams.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (name != null) exams[index].name = name;
      if (date != null) exams[index].datePerformed = date;
      if (validity != null) exams[index].validity = validity;
      if (completed != null) exams[index].isCompleted = completed;
      if (notApplicable != null) exams[index].notApplicable = notApplicable;
      if (notifications != null) exams[index].notificationsEnabled = notifications;
      notifyListeners();
    }
  }

  void removeExam(String id, {required bool isPregnant}) {
    final exams = isPregnant ? pregnantExams : nonPregnantExams;
    exams.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}

