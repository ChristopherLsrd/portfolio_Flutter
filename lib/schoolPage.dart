import 'package:flutter/material.dart';
import 'cardInfo.dart';
import 'constValues.dart';
import 'dart:js' as js;

class SchoolPage extends StatefulWidget {
  @override
  SchoolPageState createState() => SchoolPageState();
}

class SchoolPageState extends State<SchoolPage> {
  List<CardInfo> school = [
    CardInfo(
        srcImage: nantesLogo,
        title: "LP MiAR",
        years: "2021 - 2022",
        infos: ["Java", "Go", "React", "SQL", "TOEIC : 765"],
        link: "https://iutnantes.univ-nantes.fr/",
        complement: "Obtenue"),
    CardInfo(
        srcImage: maupertuisLogo,
        title: "BTS SNIR",
        years: "2019 - 2021",
        infos: ["C", "C++", "UML", "CCNA", "Modèle OSI"],
        link: "https://www.lyceemaupertuis.bzh/",
        complement: "Obtenu"),
    CardInfo(
        srcImage: lannionLogo,
        title: "DUT Informatique",
        years: "2018 - 2019",
        infos: ["C", "Java", "UML", "SQL", "HTML5/CSS3"],
        link: "https://iut-lannion.univ-rennes.fr/",
        complement: "Formation non terminée"),
    CardInfo(
        srcImage: maupertuisLogo,
        title: "Bac STI2D",
        years: "2016 - 2018",
        infos: [
          "Arduino",
          "SysML",
          "HTML5/CSS3",
          "Modélisation 3D",
          "Conception d'un skate électrique"
        ],
        link: "https://www.lyceemaupertuis.bzh/",
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
          width: 400,
          child: Card(
            elevation: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  element.srcImage,
                  height: (width < mobileWidth) ? 100 : 150,
                  width: (width < mobileWidth) ? 100 : 150,
                  fit: BoxFit.contain,
                ),
                (element.link != "")
                    ? TextButton(
                        onPressed: () {
                          js.context.callMethod("open", [element.link]);
                        },
                        child: Text(
                          element.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                              decoration: TextDecoration.underline),
                          textAlign: TextAlign.center,
                        ))
                    : Text(
                        element.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                        textAlign: TextAlign.center,
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
            textAlign: TextAlign.center,
          ),
        ],
      );
      list.add(row);
    });
    return list;
  }
}
