import 'package:flutter/material.dart';
import 'cardInfo.dart';
import 'constValues.dart';

class SchoolPage extends StatefulWidget {
  @override
  SchoolPageState createState() => SchoolPageState();
}

class SchoolPageState extends State<SchoolPage> {
  List<CardInfo> school = [
    CardInfo(
        srcImage: "images/iutNantes.png",
        title: "LP MiAR",
        years: "2021-2022",
        infos: ["Java", "Android Studio", "Go", "React", "Javascript", "SQL","TOEIC : 765"],
        complement: "Obtenue"),
    CardInfo(
        srcImage: "images/lyceeMaupertuis.png",
        title: "BTS SNIR",
        years: "2019-2021",
        infos: ["C", "C++", "UML", "CCNA", "Modèle OSI"],
        complement: "Obtenu"),
    CardInfo(
        srcImage: "images/iutLannion.png",
        title: "DUT Informatique",
        years: "2018-2019",
        infos: ["C", "Java", "UML", "SQL", "HTML5/CSS3"],
        complement: "Formation non terminée"),
    CardInfo(
        srcImage: "images/lyceeMaupertuis.png",
        title: "Bac STI2D",
        years: "2016-2018",
        infos: ["Arduino"],
        complement: "Obtenu : Mention Bien")
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
        color: white,
        child: Center(

            child: SingleChildScrollView(
          scrollDirection:
              (width < mobileWidth) ? Axis.vertical : Axis.horizontal,
          child: (width < mobileWidth)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayCards(),
                  ],
                )
                
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    displayCards(),
                  ],
                ),
        )));
  }

  Widget displayCards() {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    List<Widget> cardList = [];
    Container c;
    school.forEach((element) {
      c = Container(
          height: (width < mobileWidth) ? 500 : 600,
          width: (width < mobileWidth) ? 400 : 400,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  element.srcImage,
                  height: (width < mobileWidth) ? 100 : 150,
                  width: (width < mobileWidth) ? 100 : 150,
                  fit: BoxFit.contain,
                ),
                Text(
                  element.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(element.years),
                Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listInfos(element.infos),
                ),
                Text(element.complement)
              ],
            ),
          ));

      cardList.add(c);
      //cardInfos.clear();
    });
    return (width < mobileWidth)
        ? Column(children: cardList)
        : Row(children: cardList);
  }

  List<Widget> listInfos(List<String> infos) {
    List<Widget> list = [];
    Row row;
    infos.forEach((element) {
      row = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.keyboard_arrow_right,
          ),
          Text(
            element,
            textAlign: TextAlign.start,
          ),
        ],
      );
      list.add(row);
    });
    return list;
  }
}
