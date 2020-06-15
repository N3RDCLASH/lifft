import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final Icon prefixIcon;

  Input(
      {Key key,
      @required this.label,
      @required this.controller,
      this.prefixIcon})
      : super(key: key);
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color(0xFFB7B7B7).withOpacity(.16),
                blurRadius: 30,
                offset: Offset(0, 10)),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: Color(0xFFB7B7B7).withOpacity(.16),
              ),
            ),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              prefix: prefixIcon,
              labelText: label,
              border: InputBorder.none,
            ),
          ),
        ),
      );
}
