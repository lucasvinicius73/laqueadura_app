import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/pregnant/pregnant_view_model.dart';
import 'package:laqueadura_app/ui/pregnant/widgets/pregnant_criteria_dropdown.dart';
import 'package:laqueadura_app/ui/widgets/send_button.dart';

class PregnancyCalculatorPage extends StatefulWidget {
  const PregnancyCalculatorPage({super.key});

  @override
  State<PregnancyCalculatorPage> createState() =>
      _PregnancyCalculatorPageState();
}

class _PregnancyCalculatorPageState extends State<PregnancyCalculatorPage> {
  final PregnantViewModel viewModel = PregnantViewModel();
  final GlobalKey _resultKey = GlobalKey();
  final ScrollController _scrollController = ScrollController();
  bool _showResults = false;

  void _calculate() {
    if (viewModel.selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Por favor, selecione a data da última menstruação'),
          backgroundColor: Colors.red.shade400,
        ),
      );
      return;
    }

    setState(() {
      _showResults = true;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      Scrollable.ensureVisible(
        _resultKey.currentContext!,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora Gestacional'),
      ),
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
                  "Data da Última Menstruação (DUM)",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
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
                          : 'Data selecionada: ${viewModel.formatDate(viewModel.selectedDate)}',
                      style: TextStyle(fontSize: 18),
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
                      setState(() {
                        _showResults = false;
                      });
                    },
                  ),
                ),
                SendButton(
                  title: "Calcular",
                  onPress: _calculate,
                ),
                if (_showResults && viewModel.selectedDate != null)
                  _buildResultsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildResultsCard() {
    return Container(
      key: _resultKey,
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xFFE7E7E7)),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              "Resultados do Cálculo",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Cálculos baseados na DUM: ${viewModel.formatDate(viewModel.selectedDate)}",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 16),

                // Idade Gestacional
                _buildResultItem(
                  icon: Icons.calendar_today,
                  title: "Idade Gestacional Atual",
                  value: viewModel.getFormattedGestationalAge(),
                  description: "Calculada até a data de hoje",
                  color: Colors.blue,
                ),
                Divider(height: 24),

                // Data Provável do Parto
                _buildResultItem(
                  icon: Icons.child_care,
                  title: "Data Provável do Parto (DPP)",
                  value: viewModel.formatDate(viewModel.getEstimatedDeliveryDate()),
                  description: "Calculada pela Regra de Naegele",
                  color: Colors.purple,
                ),
                Divider(height: 24),

                // Data limite para consentimentos
                _buildResultItem(
                  icon: Icons.assignment_turned_in,
                  title: "Data Limite para Consentimentos",
                  value: viewModel.formatDate(viewModel.getConsentDeadline()),
                  description: "60 dias antes da DPP",
                  color: Colors.orange,
                  isHighlighted: true,
                ),
                SizedBox(height: 20),

                // Interpretação
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Colors.green.shade700,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Até ${viewModel.formatDate(viewModel.getConsentDeadline())} a gestante deve concluir os consentimentos e autorizações para garantir a realização da laqueadura no parto.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.green.shade800,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 16),

                // Lembrete importante
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.amber.shade50,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.amber.shade300),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: Colors.amber.shade700,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          "Importante: essas datas são estimativas. O parto pode acontecer até duas semanas antes ou depois da DPP, dependendo da evolução da gestação.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.amber.shade900,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildResultItem({
    required IconData icon,
    required String title,
    required String value,
    required String description,
    required Color color,
    bool isHighlighted = false,
  }) {
    return Container(
      padding: isHighlighted ? EdgeInsets.all(12) : null,
      decoration: isHighlighted
          ? BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: color.withOpacity(0.3)),
            )
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade600,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isHighlighted ? color : Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
