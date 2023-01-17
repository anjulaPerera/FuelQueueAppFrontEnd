import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/startup/suggesions.dart';
import 'package:fuel/user_features/user_dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

List<String> items = [
  "petrol oct 92",
  "Petal oct 95",
  "Super diesel",
  "Diesel"
];
String dropdownValue = "petrol oct 92";

class NearestLocation extends StatefulWidget {
  const NearestLocation({Key? key}) : super(key: key);
  @override
  State<NearestLocation> createState() => _NearestLocationState();
}

class _NearestLocationState extends State<NearestLocation> {
  var city = '';
  getStation() async {
    var response = await http.get(
      Uri.parse(
          'https://fuelqueueapp-production.up.railway.app/api/v1/single/$city'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.statusCode == 200) {
      var temp = jsonDecode(response.body);
      var sheds = await temp['data'];
      print('Sheds' + sheds[0]['shed_name'].toString());

      // final prefs = await SharedPreferences.getInstance();
      // set value
      // await prefs.setStringList('sheds', sheds);

      // save in SP

      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => Suggesions(sheds: sheds)));
    } else {
      print('Failed${response.body}');
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(62, 102, 208, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (builder) {
              return UserDashboard();
            }));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
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
          Stack(
            children: [
              Column(
                children: [
                  SingleChildScrollView(scrollDirection: Axis.horizontal),
                  Container(
                    width: screenwidth,
                    height: screenheight * .6,
                    //color: Colors.pink,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(194, 227, 246, 1),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0))),
                  ),
                  Container(
                    width: screenwidth,
                    height: screenheight * .4,
                    //color: Colors.blue,
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    // Container(
                    //   width: screenwidth*.8,
                    //   height: screenheight*.5,
                    //   color: Colors.black,
                    //   child: Image(image: AssetImage('assets/loc.jpg'))),
                    Image(
                      image: AssetImage('assets/loc.jpg'),
                      width: 300,
                      height: 300,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                              child: Container(
                                  width: 200,
                                  height: 100,
                                  color: Color.fromRGBO(62, 102, 208, 1),
                                  child: Center(
                                      child: Text(
                                          'What is your nearest gas station?',
                                          style: TextStyle(
                                              fontSize: 25.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center))),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            child: Container(
                              width: 200,
                              height: 50,
                              child: TextFormField(
                                onChanged: (value) => {city = value},
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your nearest location';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  filled: true,
                                  fillColor: Color.fromRGBO(62, 102, 208, 1),
                                ),
                              ),
                            ),
                          ),
                          // Center(
                          //   child: Padding(
                          //     padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                          //     child: Container(
                          //         width: 200,
                          //         height: 100,
                          //         color: Color.fromRGBO(62, 102, 208, 1),
                          //         child: Center(
                          //             child: Text('Fuel Type?' , style: TextStyle(fontSize: 25.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center))),
                          //   ),
                          // ),
                          // DropdownButton<String>(
                          //   onChanged: (String? newValue) {
                          //     setState(() {
                          //       dropdownValue = newValue!;
                          //     });
                          //   },
                          //   value: dropdownValue,
                          //   style: TextStyle(color: Colors.black, fontSize: 20),
                          //   icon: Icon(
                          //     Icons.arrow_drop_down,
                          //     color: Colors.black,
                          //     size: 40,
                          //   ),
                          //   items: items
                          //       .map<DropdownMenuItem<String>>((String value) {
                          //     return DropdownMenuItem<String>(
                          //       value: value,
                          //       child: Text(value),
                          //     );
                          //   }).toList(),
                          // ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 30),
                            child: TextButton(
                                onPressed: () {
                                  getStation();
                                  // Navigator.of(context).push(
                                  //     MaterialPageRoute(builder: (context) {
                                  //   return Suggesions();
                                  // }));
                                },
                                child: Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(color: Colors.white),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5))),
                                    child: Center(
                                        child: Text(
                                      "Search",
                                      style: TextStyle(color: Colors.black),
                                    )))),
                          )
                        ],
                      ),
                      width: screenwidth * .7,
                      height: screenheight * .5,
                      //color: Colors.pink,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromRGBO(62, 102, 208, 1),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
