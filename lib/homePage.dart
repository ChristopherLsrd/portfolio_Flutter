import 'package:flutter/material.dart';
import 'package:portfolio/constValues.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:js' as js;
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Container(
        color: white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(circlePhoto),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  width: (width < mobileWidth) ? width / 1.5 : width / 3,
                  child: Text(
                    "Développeur Windev, Webdev et Windev Mobile chez Sesame Informatique à Dinan, agé de 23 ans, venant de Saint-Malo. J'aime lire, la musique, le football et les jeux vidéos.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(
                  width: 175,
                  height: 50,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: black,
                        side: const BorderSide(
                          width: 0.2,
                          color: black,
                        )),
                    onPressed: () {
                      js.context.callMethod("open", [
                  "https://github.com/ChristopherLsrd/portfolio_flutter/blob/main/images/HTML_CSS.png "
                ]);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.solidFilePdf),
                        Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            "Mon CV",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      );
  }

}
