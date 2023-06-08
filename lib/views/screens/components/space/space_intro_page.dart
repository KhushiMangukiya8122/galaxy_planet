import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SpaceIntroPage extends StatefulWidget {
  const SpaceIntroPage({Key? key}) : super(key: key);

  @override
  State<SpaceIntroPage> createState() => _SpaceIntroPageState();
}

class _SpaceIntroPageState extends State<SpaceIntroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 400,
                  width: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/images/galaxy_space.png",
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                "S P A C E",
                style: TextStyle(
                  fontSize: 60,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                "An International Aeronautics & \n Space Administration",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      await prefs.setBool('isIntroVisited', true);

                      Navigator.of(context).pushNamed('space');

                    },
                    child: Row(
                      children: [
                        Text("Start"),
                        Icon(
                          Icons.navigate_next,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.gif",),
              fit: BoxFit.cover,
            )
        ),
      ),
    );
  }
}
