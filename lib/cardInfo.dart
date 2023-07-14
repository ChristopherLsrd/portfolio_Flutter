import 'dart:html';

import 'package:flutter/material.dart';

class CardInfo {
  String srcImage="";
  String title="";
  String years="";
  List<String> infos=[];
  String complement="";
  String link="";

  CardInfo({required this.srcImage,required this.title,required this.years,required this.infos,required this.complement, this.link=""});
}