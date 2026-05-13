import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

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

  factory ExamItem.fromJson(Map<String, dynamic> json) {
    return ExamItem(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      datePerformed: json['datePerformed'] != null ? DateTime.parse(json['datePerformed'] as String) : null,
      validity: ExamValidity.values.firstWhere(
        (e) => e.name == json['validity'],
        orElse: () => ExamValidity.threeMonths,
      ),
      isCompleted: json['isCompleted'] as bool? ?? false,
      notApplicable: json['notApplicable'] as bool? ?? false,
      notificationsEnabled: json['notificationsEnabled'] as bool? ?? true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'datePerformed': datePerformed?.toIso8601String(),
      'validity': validity.name,
      'isCompleted': isCompleted,
      'notApplicable': notApplicable,
      'notificationsEnabled': notificationsEnabled,
    };
  }

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

  factory ChecklistItem.fromJson(Map<String, dynamic> json) {
    return ChecklistItem(
      id: json['id'] as String,
      title: json['title'] as String,
      datePerformed: json['datePerformed'] != null ? DateTime.parse(json['datePerformed'] as String) : null,
      isCompleted: json['isCompleted'] as bool? ?? false,
      notApplicable: json['notApplicable'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'datePerformed': datePerformed?.toIso8601String(),
      'isCompleted': isCompleted,
      'notApplicable': notApplicable,
    };
  }
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
  
  ChecklistViewModel() {
    loadData();
  }
  
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

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    
    final dumStr = prefs.getString('checklist_dum');
    if (dumStr != null) {
      _dum = DateTime.parse(dumStr);
      _calculator = PregnancyCalculator(_dum!);
    }
    
    final lastAuthStr = prefs.getString('checklist_last_auth');
    if (lastAuthStr != null) {
      _lastAuthorizationDate = DateTime.parse(lastAuthStr);
    }
    
    final pExamsStr = prefs.getStringList('checklist_pregnant_exams');
    if (pExamsStr != null) {
      pregnantExams = pExamsStr.map((e) => ExamItem.fromJson(jsonDecode(e))).toList();
    }
    
    final npExamsStr = prefs.getStringList('checklist_non_pregnant_exams');
    if (npExamsStr != null) {
      nonPregnantExams = npExamsStr.map((e) => ExamItem.fromJson(jsonDecode(e))).toList();
    }
    
    final pCheckStr = prefs.getStringList('checklist_pregnant_checklist');
    if (pCheckStr != null) {
      // Mesclar o estado salvo com a lista inicial
      final savedItems = pCheckStr.map((e) => ChecklistItem.fromJson(jsonDecode(e))).toList();
      for (var savedItem in savedItems) {
        final index = pregnantChecklist.indexWhere((item) => item.id == savedItem.id);
        if (index != -1) {
          pregnantChecklist[index] = savedItem;
        }
      }
    }
    
    final npCheckStr = prefs.getStringList('checklist_non_pregnant_checklist');
    if (npCheckStr != null) {
      // Mesclar o estado salvo com a lista inicial
      final savedItems = npCheckStr.map((e) => ChecklistItem.fromJson(jsonDecode(e))).toList();
      for (var savedItem in savedItems) {
        final index = nonPregnantChecklist.indexWhere((item) => item.id == savedItem.id);
        if (index != -1) {
          nonPregnantChecklist[index] = savedItem;
        }
      }
    }
    
    notifyListeners();
  }

  Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    
    if (_dum != null) {
      await prefs.setString('checklist_dum', _dum!.toIso8601String());
    } else {
      await prefs.remove('checklist_dum');
    }
    
    if (_lastAuthorizationDate != null) {
      await prefs.setString('checklist_last_auth', _lastAuthorizationDate!.toIso8601String());
    } else {
      await prefs.remove('checklist_last_auth');
    }
    
    await prefs.setStringList('checklist_pregnant_exams', pregnantExams.map((e) => jsonEncode(e.toJson())).toList());
    await prefs.setStringList('checklist_non_pregnant_exams', nonPregnantExams.map((e) => jsonEncode(e.toJson())).toList());
    
    await prefs.setStringList('checklist_pregnant_checklist', pregnantChecklist.map((e) => jsonEncode(e.toJson())).toList());
    await prefs.setStringList('checklist_non_pregnant_checklist', nonPregnantChecklist.map((e) => jsonEncode(e.toJson())).toList());
  }

  void setDum(DateTime date) {
    _dum = date;
    _calculator = PregnancyCalculator(date);
    saveData();
    notifyListeners();
  }

  void setLastAuthorizationDate(DateTime date) {
    _lastAuthorizationDate = date;
    saveData();
    notifyListeners();
  }

  void updateChecklistItem(String id, {DateTime? date, bool? completed, bool? notApplicable, bool isPregnant = true}) {
    final list = isPregnant ? pregnantChecklist : nonPregnantChecklist;
    final index = list.indexWhere((item) => item.id == id);
    if (index != -1) {
      if (date != null) list[index].datePerformed = date;
      if (completed != null) list[index].isCompleted = completed;
      if (notApplicable != null) list[index].notApplicable = notApplicable;
      saveData();
      notifyListeners();
    }
  }

  void addExam({required bool isPregnant}) {
    final exams = isPregnant ? pregnantExams : nonPregnantExams;
    exams.add(ExamItem(id: DateTime.now().millisecondsSinceEpoch.toString()));
    saveData();
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
      saveData();
      notifyListeners();
    }
  }

  void removeExam(String id, {required bool isPregnant}) {
    final exams = isPregnant ? pregnantExams : nonPregnantExams;
    exams.removeWhere((item) => item.id == id);
    saveData();
    notifyListeners();
  }
}

