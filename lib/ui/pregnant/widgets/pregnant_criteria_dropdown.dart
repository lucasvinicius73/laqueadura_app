import 'package:flutter/material.dart';
import 'package:laqueadura_app/ui/pregnant/pregnant_view_model.dart';

class PregnantCriteriaDropdown extends StatelessWidget {
  const PregnantCriteriaDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    final PregnantViewModel viewModel = PregnantViewModel();

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, child) => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFE7E7E7),
            ),
            borderRadius: BorderRadius.circular(6)),
        width: double.infinity,
        height: 41,
        child: DropdownButtonHideUnderline(
            child: DropdownButton(
          value: viewModel.criteria,
          isExpanded: true,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w400,
            height: 0,
            overflow: TextOverflow.clip,
          ),
          items: viewModel.criteriaList.map<DropdownMenuItem<String>>((value) {
            return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ));
          }).toList(),
          onChanged: (String? value) {
            viewModel.changeDropDown(value);
          },
        )),
      ),
    );
  }
}
