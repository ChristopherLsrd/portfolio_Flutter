import 'package:flutter/material.dart';

class ProgressBarInfo {
  String category="";
  String title="";
  double minHeight=20;
  double value=0;
  Color color=Colors.red;

  ProgressBarInfo({required this.category,required this.title,this.minHeight=20,required this.value,required this.color});
}