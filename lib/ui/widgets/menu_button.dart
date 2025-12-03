import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.subIcon,
    this.isFirst = false,
    this.route = "/steps",
  });

  final String title;
  final String subtitle;
  final String icon;
  final String subIcon;
  final String route;
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: ElevatedButton(
          onPressed: () => Navigator.of(context).pushNamed(route),
          style: ButtonStyle(
            elevation: WidgetStatePropertyAll(0),
            backgroundColor: WidgetStatePropertyAll(
                isFirst ? Color(0xffD8AEA2) : Color(0xFFF8F8F8)),
            padding: WidgetStatePropertyAll(
                EdgeInsets.only(left: 23, right: 8, bottom: 12, top: 12)),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(21))),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Column(
                  // mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 29,
                      height: 29,
                      padding: EdgeInsets.all(6),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(21)),
                      child: Image.asset(subIcon),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      title,
                      style: TextStyle(
                          color:
                              isFirst ? Color(0xFF5B2F22) : Color(0xFF5B2F22),
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 0.9),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      subtitle,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 13,
                          color:
                              isFirst ? Color(0xFF705047) : Color(0xFF705047),
                          height: 1),
                    ),
                  ],
                ),
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 118),
                //width: 118,
                //height: 92,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(21),
                ),
                padding: EdgeInsets.all(8),
                child: Center(
                  child: Image.asset(icon),
                ),
              )
            ],
          )),
    );
  }
}
