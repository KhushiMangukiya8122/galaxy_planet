import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../utils/list.dart';

class Space extends StatefulWidget {
  const Space({Key? key}) : super(key: key);

  @override
  State<Space> createState() => _SpaceState();
}

class _SpaceState extends State<Space> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Space"),
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
                  "Space",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "E x p l o r a t i o n",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 170,
                viewportFraction: 0.8,
                autoPlay: true,
                autoPlayCurve: Curves.easeInOut,
                enlargeCenterPage: true,
              ),
              items: images
                  .map(
                    (e) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(e), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(24),
                  ),
                ),
              )
                  .toList(),
            ),
            SizedBox(
              height: 16,
            ),
            Divider(),
            Center(
              child: Text(
                "Space image",
                style: TextStyle(color: Colors.white,),
              ),
            ),
            Divider(),
            Expanded(
              flex: 12,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemCount: allimages.length,
                  itemBuilder: (context, i) {
                    return GestureDetector(
                      onTap: () {
                        index = i;
                        Navigator.of(context).pushNamed('detail_page',
                            arguments: images[i]);
                      },
                      child: Container(
                        height: 125,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          image: DecorationImage(
                            image: AssetImage("${allimages[i]['image']}"),
                            fit: BoxFit.cover,
                          ),
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    );
                  },
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
