import 'dart:math';

import 'package:flutter/material.dart';
import '../../../../models/planet_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  List bookMark = [];
  List Bookmark1 = [];
  String SelectedOption = "Option 1";

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
      lowerBound: 0,
      upperBound: 2 * pi,
    );
    animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    Planet data = ModalRoute.of(context)!.settings.arguments as Planet;

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Bookmark1.add(data.name);
              bookMark.add(data.name);
            },
            icon: Icon(
              Icons.favorite_outline,
            ),
          ),
          PopupMenuButton(
            icon: const Icon(Icons.more_vert,),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: "Option 1",
                child: Row(
                  children: [
                    const Icon(Icons.bookmark_add_outlined,
                        color: Colors.black),
                    const Text("All BookMark"),
                  ],
                ),
              ),
              PopupMenuItem(
                value: "Option 2",
                child: Row(
                  children: [
                    const Icon(Icons.light_mode_outlined, color: Colors.black),
                    const Text("Theme"),
                  ],
                ),
              ),
            ],
            onSelected: (selectedOption) {
              setState(() {
                SelectedOption = selectedOption;
              });
              if (selectedOption == "Option 1") {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Container(
                      height: 600,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 300,
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Icon(
                                          Icons.close,
                                        ),
                                      ),
                                      Text(
                                        "Dismiss",
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Container(
                              child: ListView.builder(
                                itemCount: bookMark.length,
                                itemBuilder: (context, i) => ListTile(
                                  title: Text("${data.name}"),
                                  trailing: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        bookMark.remove(data.name);
                                        Bookmark1.remove(data.name);
                                        Navigator.of(context).pop();
                                      });
                                    },
                                    icon: Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else if (selectedOption == "Option 2") {
                setState(() {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Search Engine"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("Center")
                        ],
                      ),
                    ),
                  );
                });
              }
            },
          ),
        ],
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "${data.name1}",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Text(
              "${data.Details1}",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            AnimatedBuilder(
              animation: animationController,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "${data.image}",
                    ),
                  ),
                ),
              ),
              builder: (context, widget) {
                return Transform.rotate(
                  angle: animationController.value,
                  child: widget,
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Velocity",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "🛰 ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${data.velocity}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Distance",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "🚀 ",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${data.distance}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Surface_gravity",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "🌠",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${data.surface_gravity}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Surface_Temp",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "🌡",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${data.Surface_Temp}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Rotation_Period",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "🌌",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${data.Rotation_Period}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Solar_orbit_period",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "⏳",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    "${data.solar_orbit_period}",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "${data.description}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
