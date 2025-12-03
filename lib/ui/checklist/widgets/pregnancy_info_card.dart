import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:laqueadura_app/ui/checklist/checklist_view_model.dart';

class PregnancyInfoCard extends StatelessWidget {
  const PregnancyInfoCard({
    super.key,
    required this.calculator,
    required this.onEditDum,
  });

  final PregnancyCalculator calculator;
  final VoidCallback onEditDum;

  @override
  Widget build(BuildContext context) {
    final isDeadlinePassed = calculator.isDeadlinePassed;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0xffD8AEA2),
            const Color(0xffD8AEA2).withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xffD8AEA2).withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(
                        Icons.pregnant_woman,
                        color: Colors.white,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Text(
                        "Informações da Gestação",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onEditDum,
                      icon: const Icon(Icons.edit, color: Colors.white),
                      tooltip: "Editar DUM",
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // DUM
                _InfoRow(
                  icon: Icons.calendar_month,
                  label: "DUM",
                  value: DateFormat('dd/MM/yyyy').format(calculator.dum),
                ),
                const SizedBox(height: 12),

                // Idade Gestacional
                _InfoRow(
                  icon: Icons.child_friendly,
                  label: "Idade gestacional",
                  value: calculator.gestationalAge.toString(),
                ),
                const SizedBox(height: 12),

                // DPP
                _InfoRow(
                  icon: Icons.event,
                  label: "Data Provável do Parto",
                  value: DateFormat('dd/MM/yyyy').format(calculator.dpp),
                ),
                const SizedBox(height: 12),

                // Prazo para autorizações
                _InfoRow(
                  icon: Icons.warning_amber,
                  label: "Prazo final para autorizações",
                  value: DateFormat('dd/MM/yyyy')
                      .format(calculator.authorizationDeadline),
                  isWarning: isDeadlinePassed,
                ),
              ],
            ),
          ),

          // Alerta se prazo passou
          if (isDeadlinePassed)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red.shade600,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Seu prazo para autorizações já passou em ${DateFormat('dd/MM/yyyy').format(calculator.authorizationDeadline)}. Procure sua unidade de saúde para reorientação.",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            )
          else
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer, color: Colors.white),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Faltam ${calculator.daysUntilDeadline} dias para o prazo de autorizações",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
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

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.isWarning = false,
  });

  final IconData icon;
  final String label;
  final String value;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: isWarning ? Colors.amber.shade200 : Colors.white70,
          size: 20,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: isWarning ? Colors.amber.shade200 : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

