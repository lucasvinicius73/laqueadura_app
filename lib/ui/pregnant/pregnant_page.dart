import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/pregnant/pregnant_view_model.dart';
import 'package:laqueadura_app/ui/pregnant/widgets/pregnant_criteria_dropdown.dart';
import 'package:laqueadura_app/ui/widgets/send_button.dart';

class PregnantPage extends StatefulWidget {
  const PregnantPage({super.key});

  @override
  State<PregnantPage> createState() => _PregnantPageState();
}

class _PregnantPageState extends State<PregnantPage> {
  final PregnantViewModel viewModel = PregnantViewModel();
  final GlobalKey _tableKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();

  void _scrollToTable() {
    Scrollable.ensureVisible(
      _tableKey.currentContext!,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) { 
    return Scaffold(
      appBar: AppBar(),
      body: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                PregnantCriteriaDropdown(),
                Text(
                  "Data da última menstruação",
                  style: TextStyle(fontSize: 20),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE7E7E7),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  height: 50,
                  child: Center(
                    child: Text(
                      viewModel.selectedDate == null
                          ? 'Nenhuma data selecionada'
                          : 'Data selecionada: ${viewModel.selectedDate!.toLocal()}'
                              .split('00')[0],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE7E7E7),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: CalendarDatePicker(
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                    onDateChanged: (DateTime date) {
                      viewModel.changeDate(date);
                    },
                  ),
                ),
                SendButton(
                    title: "Calcular",
                    onPress: () {
                      _scrollToTable();
                    }),
                Container(
                  key: _tableKey,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Color(0xFFE7E7E7),
                      ),
                      borderRadius: BorderRadius.circular(6)),
                  width: double.infinity,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Cálculos baseados na data 21/11/2023",
                        style: TextStyle(fontSize: 16),
                      ),
                      ListTile(
                        title: Text("Data estimada da última mentruação:"),
                        subtitle: Text("21/11/2024"),
                      ),
                      ListTile(
                        title: Text("Data provável da concepção:"),
                        subtitle: Text("21/11/2024"),
                      ),
                      ListTile(
                        title: Text("Idade gestacional hoje:"),
                        subtitle: Text("21/11/2024"),
                      ),
                      ListTile(
                        title: Text("Prazo para a documentação necessária:"),
                        subtitle: Text("21/11/2024"),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
