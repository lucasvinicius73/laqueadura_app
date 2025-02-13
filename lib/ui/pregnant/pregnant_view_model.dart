import 'package:flutter/cupertino.dart';

class PregnantViewModel extends ChangeNotifier {
  List<String> criteriaList = [
    "Gestante X",
    "Gestante Y",
    "Gestante Z",
    "Puerpera",
    "Selecionar Critério"
  ];
  String criteria = "Selecionar Critério";

  DateTime? selectedDate;

  void changeDropDown(String? value) {
    criteria = value!;
    notifyListeners();
  }

  void changeDate(DateTime? date) {
    selectedDate = date;
    notifyListeners();
  }
}
