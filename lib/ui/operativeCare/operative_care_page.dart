import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/operativeCare/pre_operative_page.dart';
import 'package:laqueadura_app/ui/operativeCare/post_operative_page.dart';
import 'package:laqueadura_app/ui/operativeCare/widgets/operative_care_button.dart';
import 'package:laqueadura_app/ui/operativeCare/widgets/text.dart';

class OperativeCarePage extends StatelessWidget {
  const OperativeCarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cuidados Operatórios"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            // Ícone ilustrativo
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: const Color(0xFFCD5E91).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.medical_services,
                size: 50,
                color: Color(0xFFCD5E91),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              textOperativeCare,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey.shade700,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 32),
            OperativeCareButton(
              title: "Cuidados pré-operatório",
              asset: "assets/operativeCare/plastic.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreOperativePage(),
                  ),
                );
              },
            ),
            const SizedBox(height: 16),
            OperativeCareButton(
              title: "Cuidados pós-operatório",
              asset: "assets/operativeCare/surgery.png",
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PostOperativePage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
