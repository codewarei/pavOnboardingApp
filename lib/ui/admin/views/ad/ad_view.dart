import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inspirze_onboarding_app/ui/admin/views/ad/add_Ad.dart';

import '../../widgets/nav_drawer_widget.dart';


class AdView extends StatefulWidget {
  const AdView({Key? key}) : super(key: key);

  @override
  State<AdView> createState() => _AdViewState();
}

class _AdViewState extends State<AdView> {

  late List lessons;

  @override
  void initState() {
    lessons = getLessons();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ListTile makeListTile(Lesson lesson) => ListTile(
      contentPadding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      leading: Container(
        padding: const EdgeInsets.only(right: 12.0),
        decoration: const BoxDecoration(
            border: Border(
                right: BorderSide(width: 1.0, color: Colors.white24))),
        child: const Icon(Icons.person, color: Colors.deepOrange),
      ),
      title: Text(
        lesson.title,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold),
      ),
      // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

      subtitle: Row(
        children: const <Widget>[
          // Expanded(
          //     flex: 1,
          //     child: Container(
          //       // tag: 'hero',
          //       child: LinearProgressIndicator(
          //           backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
          //           value: lesson.indicatorValue,
          //           valueColor: AlwaysStoppedAnimation(Colors.green)),
          //     )),
          Expanded(
            flex: 4,
            child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text('Start by taking a couple of minutes to read the info in this section.',
                    style: TextStyle(color: Colors.black))),
          )
        ],
      ),
      trailing: const Icon(Icons.keyboard_arrow_right,
          color: Colors.white, size: 30.0),
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) =>  const AddAd()));
      },
    );

    Card makeCard(Lesson lesson) => Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
      child: Container(
        decoration: const BoxDecoration(color: Colors.black12),
        child: makeListTile(lesson),
      ),
    );

    final makeBody = Container(
      // decoration: BoxDecoration(color: Color.fromRGBO(58, 66, 86, 1.0)),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: lessons.length,
        itemBuilder: (BuildContext context, int index) {
          return makeCard(lessons[index]);
        },
      ),

    );

    final topAppBar = AppBar(
      elevation: 0.1,
      backgroundColor: Colors.blueGrey,
      title: const Text('Ads'),
      centerTitle: true,
      // automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        )
      ],
    );

    return Scaffold(

      appBar: topAppBar,
      body: SingleChildScrollView(child: makeBody),
      drawer: const NavDrawer(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrange,
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const AddAd()));

        },
      ),
    );
  }
}

List getLessons() {
  return [
    Lesson(
        title: "Ad 1",
        level: "Start by taking a couple of minutes to read the info in this section.",
        indicatorValue: 0.33,
        price: 20,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Ad 2",
        level: "Start by taking a couple of minutes to read the info in this section.",
        indicatorValue: 0.33,
        price: 50,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),
    Lesson(
        title: "Ad 3",
        level: "Start by taking a couple of minutes to read the info in this section.",
        indicatorValue: 0.66,
        price: 30,
        content:
        "Start by taking a couple of minutes to read the info in this section. Launch your app and click on the Settings menu.  While on the settings page, click the Save button.  You should see a circular progress indicator display in the middle of the page and the user interface elements cannot be clicked due to the modal barrier that is constructed."),

  ];
}

class Lesson {
  String title;
  String level;
  double indicatorValue;
  int price;
  String content;

  Lesson(
      {required this.title,
        required this.level,
        required this.indicatorValue,
        required this.price,
        required this.content});
}
