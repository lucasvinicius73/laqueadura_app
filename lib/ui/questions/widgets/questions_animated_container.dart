import 'package:flutter/material.dart';

class QuestionsAnimatedContainer extends StatefulWidget {
  const QuestionsAnimatedContainer({
    super.key,
    required this.title,
    required this.content,
  });

  final String title;
  final String content;

  @override
  State<QuestionsAnimatedContainer> createState() =>
      _QuestionsAnimatedContainerState();
}

class _QuestionsAnimatedContainerState
    extends State<QuestionsAnimatedContainer> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          height: _isExpanded ? 200.0 : 100.0, // Altura do container
          decoration: BoxDecoration(
            color: Color(0xFFF1F1F3),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                
              ),
            ],
          )),
    );
  }
}
