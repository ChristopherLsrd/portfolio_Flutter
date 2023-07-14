import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/homePage.dart';
import 'package:portfolio/projectPage.dart';
import 'package:portfolio/schoolPage.dart';
import 'package:portfolio/skillPage.dart';
import 'package:portfolio/workPage.dart';
import 'dart:js' as js;
import 'dart:ui';
import 'package:url_launcher/url_launcher.dart';

import 'constValues.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      title: "Portfolio",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Accueil'),
    );
  }
}

class CustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods like buildOverscrollIndicator and buildScrollbar
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget displayed = HomePage();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    return Scaffold(
      appBar: (width < mobileWidth) ? navBarMobile() : navBarDesktop(context),
      body: displayed,
      drawer: (width < mobileWidth) ? appDrawer(context) : null,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(5),
        height: 50.0,
        color: white,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
              onPressed: () {
                js.context.callMethod(
                    "open", ["https://www.github.com/ChristopherLsrd"]);
              },
              icon: FaIcon(FontAwesomeIcons.github)),
          IconButton(
              onPressed: () {
                js.context.callMethod("open", [
                  "https://www.linkedin.com/in/christopher-lessirard-661436172 "
                ]);
              },
              icon: FaIcon(FontAwesomeIcons.linkedin)),
          IconButton(
              onPressed: () async {
                String email = 'christopher.lessirard@gmail.com';
                String emailUrl = "mailto:$email";

                if (await canLaunch(emailUrl)) {
                  await launch(emailUrl);
                } else {
                  throw "Error occured sending an email";
                }
              },
              icon: Icon(Icons.mail)),
        ]),
      ),
    );
  }

  AppBar navBarMobile() {
    return AppBar(
      iconTheme: IconThemeData(color: black),
      backgroundColor: white,
    );
  }

  AppBar navBarDesktop(BuildContext context) {
    return AppBar(
      title: Text(
        "Christopher Lessirard",
        style: TextStyle(color: black),
      ),
      backgroundColor: white,
      actions: [
        TextButton(
          onPressed: () {
            setState(() {
              displayed = displayedPage(1);
            });
          },
          child: Padding(
            padding: EdgeInsets.all(10),
            child: iconText(Icons.home, "Accueil"),
          ),
          style: TextButton.styleFrom(foregroundColor: black),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                displayed = displayedPage(2);
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: iconText(Icons.school, "Formations"),
            ),
            style: TextButton.styleFrom(foregroundColor: black)),
        TextButton(
            onPressed: () {
              setState(() {
                displayed = displayedPage(3);
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: iconText(Icons.work, "Expériences"),
            ),
            style: TextButton.styleFrom(foregroundColor: black)),
        TextButton(
            onPressed: () {
              setState(() {
                displayed = displayedPage(4);
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: iconText(Icons.computer, "Projets"),
            ),
            style: TextButton.styleFrom(foregroundColor: black)),
        TextButton(
            onPressed: () {
              setState(() {
                displayed = displayedPage(5);
              });
            },
            child: Padding(
              padding: EdgeInsets.all(10),
              child: iconText(Icons.settings, "Compétences"),
            ),
            style: TextButton.styleFrom(foregroundColor: black)),
      ],
    );
  }

  Drawer appDrawer(BuildContext context) {
    return Drawer(
      backgroundColor: white,
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: black,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Christopher Lessirard',
                  style: TextStyle(
                      color: white, fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: black,
            ),
            title: const Text('Accueil'),
            onTap: () {
              setState(() {
                displayed = displayedPage(1);
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.school,
              color: black,
            ),
            title: const Text('Formations'),
            onTap: () {
              setState(() {
                displayed = displayedPage(2);
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.work,
              color: black,
            ),
            title: const Text('Expériences'),
            onTap: () {
              setState(() {
                displayed = displayedPage(3);
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.computer,
              color: black,
            ),
            title: const Text('Projets'),
            onTap: () {
              setState(() {
                displayed = displayedPage(4);
                Navigator.pop(context);
              });
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: black,
            ),
            title: const Text('Compétences'),
            onTap: () {
              setState(() {
                displayed = displayedPage(5);
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  Container iconText(IconData icon, String text) {
    return Container(
      child: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 5),
            child: Text(text),
          )
        ],
      ),
    );
  }

  Widget displayedPage(int page) {
    final display;
    switch (page) {
      case 1:
        display = HomePage();
        break;
      case 2:
        display = SchoolPage();
        break;
      case 3:
        display = WorkPage();
        break;
      case 4:
        display = ProjectPage();
        break;
      case 5:
        display = SkillPage();
        break;
      default:
        display = HomePage();
    }
    return display;
  }
}
