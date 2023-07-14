import 'package:flutter/material.dart';
import 'package:portfolio/progressbarInfo.dart';
import 'cardInfo.dart';
import 'constValues.dart';
import 'dart:js' as js;

class ProjectPage extends StatefulWidget {
  @override
  ProjectPageState createState() => ProjectPageState();
}

class ProjectPageState extends State<ProjectPage> {
  List<CardInfo> projects = [
    CardInfo(
        srcImage: flutterLogo,
        title: "Développement de mon portfolio",
        years: "Juin - Juillet 2023",
        infos: [
          "Application des connaissances de mise en page",
          "Utilisation du package url_launcher"
        ],
        link: "https://github.com/ChristopherLsrd/portfolio_flutter",
        complement: "Création de mon portfolio pour mettre en pratique les connaissances acquises"),
    CardInfo(
        srcImage: reactLogo,
        title: "Développement d'un portail web de gestions de doses de miel",
        years: "Avril 2022",
        infos: [
          "Génération d'un QR Code",
          "Impression du QR Code dans un fichier PDF"
        ],
        complement:
            "Le projet consistait à créer un portail web de gestion de doses de miel pour assurer la traçabilité de ces dernières"),
    CardInfo(
        srcImage: goLogo,
        title: "Développement d'une API REST",
        years: "Avril 2022",
        infos: [
          "Mise en place d'une documention Swagger",
          "Utilisation de BoltDB"
        ],
        link: "https://github.com/ChristopherLsrd/go_apirest",
        complement: "Création d'une API REST pour découvrir le langage"),
    CardInfo(
        srcImage: javaLogo,
        title: "Développement d'un RPG sur le terminal",
        years: "Janvier 2022",
        infos: ["Pattern State", "Fonctionnement du jeu", "Class diagram"],
        link: "https://github.com/ChristopherLsrd/RPG_DesignPatterns",
        complement:
            "Le projet consistait à créer un jeu en Java avec pour contraintes d'utiliser trois design patterns différents"),
    CardInfo(
        srcImage: javaLogo,
        title: "Développement d'un client de communication MQTT",
        years: "Novembre 2019",
        infos: [
          "Interfaces de connexion au broker MQTT",
          "Interface d'envoi et de réception des messages",
          "Envoi et éception des messages"
        ],
        complement:
            "Le projet consistait à créer un service de messagerie instantanée entre deux machines sur un même réseau"),
    CardInfo(
        srcImage: javaLogo,
        title: "Développement d'un logiciel de gestion de festivals",
        years: "Mars - Juin 2019",
        infos: [
          "Développer la gestion du planning",
          "Export du panning dans un fichier",
        ],
        complement:
            "Le projet consistait à créer un logiciel pour gérer des festivals (gestion des emplacements,gestion des plannings, gestion de la billetterie)"),
  ];
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
              : ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: width / 1.5),
                  child: displayCards(),
                ),
        )));
  }

  Widget displayCards() {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    List<Widget> cardList = [];
    Container c;
    projects.forEach((element) {
      c = Container(
          height: (width < mobileWidth) ? 500 : 600,
          width: 400,
          child: Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.all(5),
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
                    Text(
                      element.complement,
                      textAlign: TextAlign.center,
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: listInfos(element.infos),
                    ),
                  ],
                ),
              )));

      cardList.add(c);
    });
    return (width < mobileWidth)
        ? Column(children: cardList)
        : SingleChildScrollView(
            child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.start,
                spacing: 30,
                direction: Axis.horizontal,
                children: cardList),
          );

    // : Row(children: cardList);
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
