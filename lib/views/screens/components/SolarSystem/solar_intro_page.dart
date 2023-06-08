import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SolarIntroPage extends StatefulWidget {
  const SolarIntroPage({Key? key}) : super(key: key);

  @override
  State<SolarIntroPage> createState() => _SolarIntroPageState();
}

class _SolarIntroPageState extends State<SolarIntroPage> {
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
                        "assets/images/galaxy_vector.png",
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs = await SharedPreferences.getInstance();

                      await prefs.setBool('isIntroVisited', true);

                      Navigator.of(context).pushNamed('solar_system');

                    },
                    child: Row(
                      children: [
                        Text("Next"),
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
