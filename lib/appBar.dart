import 'package:flutter/material.dart';
import 'package:portfolio/constValues.dart';

AppBar navBarMobile() {
  return AppBar(
    iconTheme: IconThemeData(color: black),
    backgroundColor: white,
  );
}

AppBar navBarDesktop() {
  return AppBar(
    title: Text(
      "Christopher Lessirard",
      style: TextStyle(color: black),
    ),
    backgroundColor: white,
    actions: [
      TextButton(
        onPressed: () {},
        child: Padding(
          padding: EdgeInsets.all(10),
          child: iconText(Icons.home, "Accueil"),
        ),
        style: TextButton.styleFrom(foregroundColor: black),
      ),
      TextButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(10),
            child: iconText(Icons.school, "Formations"),
          ),
          style: TextButton.styleFrom(foregroundColor: black)),
      TextButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(10),
            child: iconText(Icons.work, "Expériences"),
          ),
          style: TextButton.styleFrom(foregroundColor: black)),
      TextButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(10),
            child: iconText(Icons.computer, "Projets"),
          ),
          style: TextButton.styleFrom(foregroundColor: black)),
      TextButton(
          onPressed: () {},
          child: Padding(
            padding: EdgeInsets.all(10),
            child: iconText(Icons.settings, "Compétences"),
          ),
          style: TextButton.styleFrom(foregroundColor: black)),
    ],
  );
}

Drawer appDrawer() {
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
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.school,
            color: black,
          ),
          title: const Text('Formations'),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.work,
            color: black,
          ),
          title: const Text('Expériences'),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.computer,
            color: black,
          ),
          title: const Text('Projets'),
          onTap: () {
            //Navigator.pop(context);
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: black,
          ),
          title: const Text('Compétences'),
          onTap: () {
            //Navigator.pop(context);
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
