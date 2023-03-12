import 'package:flutter/material.dart';
import 'package:student_helper/screens/chat.dart';
import 'package:student_helper/screens/homePage.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQDx0r_CWdry4br1C2vVdxENTUmVEZWZusVuaBuQcIxGw&s";

    return Drawer(
      child: ListView(
        children: [
          new UserAccountsDrawerHeader(
            margin: EdgeInsets.zero,
            accountName: Text(
              "Mirza Zabbar",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.1,
            ),
            accountEmail: Text(
              "mirzazabbar654@gmail.com",
              style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
              textScaleFactor: 1.1,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(imageUrl),
            ),
          ),
          new ListTile(
            title: new Text(
              "Home",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            trailing: new Icon(Icons.home, color: Colors.black),
            // leading: new Icon(Icons.web),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          new ListTile(
            title: new Text("Chat AI",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: new Icon(Icons.chat_sharp, color: Colors.black),
            // leading: new Icon(Icons.web),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chatApp(),
                  ));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          new ListTile(
            title: new Text("Voice AI",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: new Icon(
              Icons.mic_sharp,
              color: Colors.black,
            ),
            // leading: new Icon(Icons.web),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => chatApp(),
                  ));
            },
          ),
          Divider(
            color: Colors.black,
          ),
          new ListTile(
            title: new Text("MMMUT Map",
                style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: new Icon(Icons.map_sharp),
            // leading: new Icon(Icons.web),
            onTap: () {
              launcherURL(3);
            },
          ),
        ],
      ),
    );
  }
}

void launcherURL(int value) async {
  String url = "";
  if (value == 1) {
    url = "https://www.mmmut.ac.in";
  } else if (value == 2) {
    url = "https://www.mmmut.ac.in/ViewTimetable";
  } else if (value == 3) {
    url =
        "https://www.google.com/maps?ll=26.745164,83.407246&z=13&t=m&hl=en&gl=IN&mapclient=embed&saddr=Gorakhpur+Junction+railway+station,+elahibag,+Kawwa+Bagh+Colony,+Gorakhpur,+Uttar+Pradesh+273012&daddr=Madan+Mohan+Malaviya+University+Of+Technology,+Deoria+Road,+Singhariya,+Kunraghat,+Gorakhpur,+Uttar+Pradesh+273016&dirflg=d";
  } else if (value == 4) {
    url = "https://www.mmmut.ac.in/Pdf/MMMUTPrivacyPolicy.pdf";
  }
  // ignore: deprecated_member_use
  if (await canLaunch(url)) {
    // ignore: deprecated_member_use
    await launch(
      url,
      forceSafariVC: true,
      forceWebView: true,
      enableJavaScript: true,
    );
  } else {
    throw "Could Not Launch $url";
  }
}
