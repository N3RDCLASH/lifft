import 'package:flutter/material.dart';

const Color black_color = Colors.black;
const Color white_color = Colors.white;
const Color background_color1 = const Color(0xff384962);
const Color background_color2 = const Color(0xff24324B);
const Color main_color1 = const Color(0xff5AE5CC);
const Color main_color2 = const Color(0xff00F0FF);
const background_gradient = BoxDecoration(
    gradient: LinearGradient(colors: [background_color2, background_color1]));

const white_text = TextStyle(color: white_color, fontFamily: 'Roboto');
const white_border =  UnderlineInputBorder(
    borderSide:
        BorderSide(color: Colors.white, width: 1.0, style: BorderStyle.solid));
