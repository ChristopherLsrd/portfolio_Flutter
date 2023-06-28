import 'package:flutter/material.dart';
import 'package:portfolio/appBar.dart';
import 'package:portfolio/constValues.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Scaffold(
      appBar: (width < mobileWidth) ? navBarMobile() : navBarDesktop(),
      body: Container(
        color: white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage("images/circle_photo.jpg"),
              ),
              Padding(
                padding: EdgeInsets.all(25),
                child: Container(
                  width: (width<mobileWidth)?width/1.5:width/3,
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
                    onPressed: () {},
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
      ),
      drawer: (width < mobileWidth) ? appDrawer() : null,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5),
        height: 50.0,
        color: white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.github)),
          IconButton(onPressed: (){}, icon: FaIcon(FontAwesomeIcons.linkedin)),
          IconButton(onPressed: (){}, icon: Icon(Icons.mail)),
        ]),
      ),
    );
  }
}
