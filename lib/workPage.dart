import 'package:flutter/material.dart';
import 'cardInfo.dart';
import 'constValues.dart';
import 'dart:js' as js;

class WorkPage extends StatefulWidget {
  @override
  WorkPageState createState() => WorkPageState();
}

class WorkPageState extends State<WorkPage> {
  List<CardInfo> work = [
    CardInfo(
        srcImage: sesameLogo,
        title: "Développeur Windev",
        years: "Septembre 2022 -",
        infos: [
          "Logiciel de comptabilité simplifié",
          "Site web de création de protocoles de sécurité",
          "Utilisation de l'API Microsoft Graph pour la synchronisation d'agendas",
        ],
        link:"https://sesame-informatique.com/",
        complement: ""),
    CardInfo(
        srcImage: sesameLogo,
        title: "Développeur Windev junior",
        years: "Septembre 2021 - Septembre 2022",
        infos: [
          "Création d'un site web de prise de commande pour un évènement d'un client",
          "Ajout d'un module de scan de code EAN sur une application d'inventaire",
        ],
        link:"https://sesame-informatique.com/",
        complement: "Alternance"),
    CardInfo(
        srcImage: bceLogo,
        title: "Employé de lingerie",
        years:
            "Juillet 2018 - Août 2018\nJuillet 2019 - Août 2019\nJuillet 2020 - Août 2020\nJuillet 2021 - Août 2021",
        infos: ["Rangement de serviettes dans des chariots"],
        link:"https://www.blanchisserie-emeraude.fr/",
        complement: "Emploi saisonnier"),
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
    work.forEach((element) {
      c = Container(
          height: (width < mobileWidth) ? 500 : 600,
          width: (width < mobileWidth) ? 400 : 400,
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
          Flexible(
            child: Text(
              element,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      );
      list.add(row);
    });
    return list;
  }
}
