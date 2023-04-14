// ignore_for_file: unused_element

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:student_helper/screens/chat.dart';
import 'package:student_helper/screens/speech_screen.dart';
import 'package:student_helper/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> imageList = [
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyiE9vRs9W1sHB7pufIMz7dXubAQGoW2lHLIg1avS6&s",
    "https://qph.cf2.quoracdn.net/main-qimg-2c55bdf1fd6a25451a3e514fbbd88731-lq",
    "https://institutes.aglasem.com/wp-content/uploads/2019/08/Add-a-heading-72-min-1.jpg",
    "https://www.collegedekho.com/_next/image?url=https%3A%2F%2Fimg.collegedekhocdn.com%2Fmedia%2Fimg%2Finstitute%2Fcrawled_images%2FNone%2FGFGHDGJTRERYSH.jpeg&w=640&q=75",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkK_b5pXhIPikLO81yD7YF58Eig2_FubZnT8u48ThtvA&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX8NF0pIBSsCrO4vCkmBeSNh8SDTu_J55ntZfWkD4b&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTfhHrGWCpvtgtsEUnaBggMB6vPDJRQHVCn13xkvcel&s",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTX8NF0pIBSsCrO4vCkmBeSNh8SDTu_J55ntZfWkD4b&s",
    "https://staticimg.amarujala.com/assets/images/2022/01/25/750x506/mmmut_1643098251.png?w=414",
    "https://images.shiksha.com/mediadata/images/1533713000phpArFQpF.jpeg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(
          "Student Assistant...",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SpeechScreen()));
                // context, MaterialPageRoute(builder: (context) => ChatScreen()));
              },
              child: Icon(
                Icons.mic_rounded,
                size: 25.0,
              ),
            ),
          )
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 10.0),
        children: [
          Center(
            child: CarouselSlider(
              options: CarouselOptions(
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                  autoPlay: true),
              items: imageList
                  .map((e) => ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Image.network(
                              e,
                              height: 250.0,
                              width: 250.0,
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                      ))
                  .toList(),
            ),
          ),
          new Divider(height: 25.0),
          CircleAvatar(
            radius: 50,
            child: Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDx0r_CWdry4br1C2vVdxENTUmVEZWZusVuaBuQcIxGw&s",
              fit: BoxFit.contain,
              width: 100.0,
              height: 100.0,
            ),
          ),
          Divider(color: Colors.transparent),
          SizedBox(
            width: double.infinity,
            height: 130.0,
            child: Card(
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text("MMMUT Gorakhpur",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20.0)),
                    SizedBox(
                      child: Divider(),
                    ),
                    Text("Vice Chancellor: B.P. Pandey",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(
                      child: Divider(),
                    ),
                    Text("Computer Sc & Eng Dept, MMMUT Gorakhpur",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        tooltip: 'Connect To Assistant',
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => ChatApp()));
          // context, MaterialPageRoute(builder: (context) => ChatScreen()));
        },
        icon: Icon(Icons.chat),
        label: Text("Chat"),
      ),
    );
  }
}
