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
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        width: double.infinity,
        height: _isExpanded ? 200.0 : 76.0, // Altura do container
        decoration: BoxDecoration(
          color: Color(0xFFFCE9EE),
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    maxLines: 2,
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xFF8A4A66),
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Icon(
                  _isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
              ],
            ),
            if (_isExpanded)
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      widget.content,
                      style: TextStyle(
                        color: Color(0xFF544248),
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
