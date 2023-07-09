import 'package:flutter/material.dart';
import 'package:portfolio/progressbarInfo.dart';
import 'cardInfo.dart';
import 'constValues.dart';

class SkillPage extends StatefulWidget {
  @override
  SkillPageState createState() => SkillPageState();
}

class SkillPageState extends State<SkillPage> {
  List<String> categories = ['Windev', 'Web', 'BDD', 'Autres'];
  List<ProgressBarInfo> progress = [
    ProgressBarInfo(
        category: 'Windev',
        title: 'Windev',
        value: 0.8,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Windev',
        title: 'Webdev',
        value: 0.8,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Windev',
        title: 'Windev Mobile ',
        value: 0.7,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Web',
        title: 'HTML ',
        value: 0.5,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Web',
        title: 'CSS ',
        value: 0.5,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Web',
        title: 'JavaScript ',
        value: 0.2,
        color: Colors.red),
    ProgressBarInfo(
        category: 'Web',
        title: 'React ',
        value: 0.2,
        color: Colors.red),
    ProgressBarInfo(
        category: 'BDD',
        title: 'HyperFileSQL ',
        value: 0.6,
        color: Colors.green),
    ProgressBarInfo(
        category: 'BDD',
        title: 'SQL ',
        value: 0.5,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Autres',
        title: 'C/C++ ',
        value: 0.5,
        color: Colors.green),
    ProgressBarInfo(
        category: 'Autres',
        title: 'Java ',
        value: 0.4,
        color: Colors.amber),
    ProgressBarInfo(
        category: 'Autres',
        title: 'Go ',
        value: 0.3,
        color: Colors.amber),
    ProgressBarInfo(
        category: 'Autres',
        title: 'Flutter ',
        value: 0.3,
        color: Colors.amber),
  ];
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    return Container(
        color: white,
        width: width,
        height: height,
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [displayCategories()],
            )));
  }

  ClipRRect roundedProgressBar(
      double radius, double minHeight, double value, Color color) {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: TweenAnimationBuilder(
          duration: Duration(milliseconds: 500),
          tween: Tween<double>(begin: 0, end: value),
          builder: (_, double value, ___) {
            return LinearProgressIndicator(
              minHeight: minHeight,
              value: value,
              color: color,
              backgroundColor: Colors.grey.shade300,
            );
          },
        ));
  }

  Column progressBar(ProgressBarInfo progressbar) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              progressbar.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            Text(
              "${progressbar.value * 100} %",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            )
          ],
        ),
        roundedProgressBar(
            10, progressbar.minHeight, progressbar.value, progressbar.color)
      ],
    );
  }

  Column displayCategories() {
    List<Widget> categoryList = [];
    Widget widget;
    categories.forEach((element) {
      List<ProgressBarInfo> listCategory = [];
      progress.forEach((e) {
        if (e.category == element) {
          listCategory.add(e);
        }
        ;
      });

      widget = Column(children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            element,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
          ),
        ),
        displayBars(listCategory),
      ]);
      categoryList.add(widget);
    });
    return Column(
      children: categoryList,
    );
  }

  Widget displayBars(List<ProgressBarInfo> progressListCategory) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    List<Widget> progressList = [];
    Container c;
    progressListCategory.forEach((element) {
      c = Container(
        width: (width < mobileWidth) ? width / 1.25 : width / 2.5,
        padding: EdgeInsets.all(5),
        child: progressBar(element),
      );
      progressList.add(c);
    });

    return Padding(
      padding: EdgeInsets.only(bottom: 50),
      child: (width < mobileWidth)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: progressList)
          : ConstrainedBox(
              constraints: BoxConstraints(maxWidth: width),
              child: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.start,
                  spacing: 30,
                  direction: Axis.horizontal,
                  children: progressList),
            ),
    );
  }
}
