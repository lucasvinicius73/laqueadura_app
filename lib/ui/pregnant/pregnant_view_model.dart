import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class PregnantViewModel extends ChangeNotifier {
  List<String> criteriaList = [
    "Gestante X",
    "Gestante Y",
    "Gestante Z",
    "Puerpera",
    "Selecionar Critério"
  ];
  String criteria = "Selecionar Critério";

  DateTime? selectedDate; // DUM - Data da Última Menstruação

  void changeDropDown(String? value) {
    criteria = value!;
    notifyListeners();
  }

  void changeDate(DateTime? date) {
    selectedDate = date;
    notifyListeners();
  }

  // Calcula a idade gestacional em semanas e dias
  Map<String, int>? getGestationalAge() {
    if (selectedDate == null) return null;

    final now = DateTime.now();
    final difference = now.difference(selectedDate!);
    final totalDays = difference.inDays;

    final weeks = totalDays ~/ 7; // Divisão inteira
    final days = totalDays % 7; // Resto da divisão

    return {'weeks': weeks, 'days': days};
  }

  // Calcula a Data Provável do Parto usando a Regra de Naegele
  // DPP = DUM + 7 dias - 3 meses + 1 ano
  DateTime? getEstimatedDeliveryDate() {
    if (selectedDate == null) return null;

    // Adiciona 7 dias
    DateTime dpp = selectedDate!.add(Duration(days: 7));

    // Subtrai 3 meses
    int newMonth = dpp.month - 3;
    int newYear = dpp.year;

    if (newMonth <= 0) {
      newMonth += 12;
      newYear -= 1;
    }

    dpp = DateTime(newYear + 1, newMonth, dpp.day); // Adiciona 1 ano

    return dpp;
  }

  // Calcula a data limite para obter os consentimentos (DPP - 60 dias)
  DateTime? getConsentDeadline() {
    final dpp = getEstimatedDeliveryDate();
    if (dpp == null) return null;

    return dpp.subtract(Duration(days: 60));
  }

  // Formata data para dd/MM/yyyy
  String formatDate(DateTime? date) {
    if (date == null) return '--';
    return DateFormat('dd/MM/yyyy').format(date);
  }

  // Retorna string formatada da idade gestacional
  String getFormattedGestationalAge() {
    final age = getGestationalAge();
    if (age == null) return '--';

    return '${age['weeks']} semanas e ${age['days']} dias';
  }
}
