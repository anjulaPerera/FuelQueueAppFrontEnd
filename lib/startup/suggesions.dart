import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/startup/neaarest_station.dart';
import 'package:fuel/user_features/user_dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Suggesions extends StatefulWidget {
  var sheds = [];
  Suggesions({Key? key, required this.sheds}) : super(key: key);

  @override
  State<Suggesions> createState() => _SuggesionsState(sheds);
}

class _SuggesionsState extends State<Suggesions> {
  var sheds = [];
  _SuggesionsState(this.sheds);

  @override
  void initState() {
    super.initState();
    print('Sheds in suggestions');
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(62, 102, 208, 1),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
              return const UserDashboard();
            }));
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return NavBar();
              }));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Image(
                image: AssetImage('assets/loc.jpg'),
                width: 300,
                height: 300,
              ),
              SingleChildScrollView(
                child: getTextWidgets(sheds),
                // child: Container(
                //   width: screenwidth * .9,
                //   height: 600,
                //   color: Colors.white,
                // ),
              )
            ],
          ),
        ],
      ),
      backgroundColor: const Color.fromRGBO(194, 227, 246, 1),
    );
  }
}

Widget getTextWidgets(List<dynamic> sheds) {
  print("Suggestion Sheds");
  // ignore: unnecessary_new
  return SingleChildScrollView(
    child: Container(
      width: 400,
      height: 250,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(62, 102, 208, 1),
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          )),
      // color: Colors.amber,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                children: [
                  const Text("ShedName",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                  const SizedBox(
                    width: 60,
                  ),
                  const Text("Waiting Time",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: new Column(
                  children: sheds
                      .map((item) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    new Text(
                                      item['shed_name'],
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    const SizedBox(
                                      width: 100,
                                    ),
                                    getWaitingTime(item['_id'])
                                  ],
                                ),
                              ],
                            ),
                          ))
                      .toList()),
            ),
          ],
        ),
      ),
    ),
  );
}

getWaitingTime(String id) {
  var waitingTime = '0';
  fetchWaitingTime(id).then((value) => {waitingTime = value});
  return new Container(
      child: Text(waitingTime, style: const TextStyle(fontSize: 20)));
}

Future<String> fetchWaitingTime(String id) async {
  var response = await http.get(
    Uri.parse(
        'https://fuelqueueapp-production.up.railway.app/api/v1/waitingtime/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  if (response.statusCode == 200) {
    print('Success fetchWaitingTime' + response.body.toString());
    var temp = jsonDecode(response.body);
    var waitingTime = temp['data'].toString();
    return waitingTime;
  } else {
    print('Failed fetchWaitingTime' + response.body.toString());
    print('Something went wrong');
    return 0.toString();
  }
}
