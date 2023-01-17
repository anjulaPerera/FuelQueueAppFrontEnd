import 'package:flutter/material.dart';
import 'package:fuel/owner_features/owner_dashboard.dart';
import 'package:fuel/owner_features/owner_fuel_status.dart';
import 'package:fuel/user_features/user_dashboard.dart';
import 'package:fuel/user_features/user_fuel_status.dart';

class OwnerQueueStatus extends StatelessWidget {
  const OwnerQueueStatus({Key? key}) : super(key: key);

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
              return OwnerDashboard();
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
              //Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //return Settings();
              //}));
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                width: screenwidth * .7,
                height: 50,
                color: Color.fromRGBO(62, 102, 208, 1),
              ),
              SizedBox(height: 20),
              Container(
                width: screenwidth * .8,
                height: screenheight * .8,
                //color: Colors.yellow,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text('Queue Status',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromRGBO(128, 184, 228, 1),
                            fontWeight: FontWeight.bold)),
                    Container(
                        width: 100,
                        height: 100,
                        color: Colors.pink,
                        child: Image(image: AssetImage('assets/queue.jpg'))),
                    SizedBox(height: 10),
                    Center(
                        child: Text('Total vehicles \n         for:',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Color.fromRGBO(128, 184, 228, 1)))),
                    SizedBox(height: 10),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('petrol',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color.fromRGBO(128, 184, 228, 1))),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 60,
                                height: 50,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: 100,
                            thickness: 2,
                            color: Color.fromRGBO(128, 184, 228, 1),
                          ),
                          Column(
                            children: [
                              Text('Diesel',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color.fromRGBO(128, 184, 228, 1))),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 60,
                                height: 50,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text('Average time \n  for waiting:',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Color.fromRGBO(128, 184, 228, 1))),
                    SizedBox(
                      height: 20,
                    ),
                    IntrinsicHeight(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('petrol',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color.fromRGBO(128, 184, 228, 1))),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 60,
                                height: 70,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                          VerticalDivider(
                            width: 100,
                            thickness: 2,
                            color: Color.fromRGBO(128, 184, 228, 1),
                          ),
                          Column(
                            children: [
                              Text('Diesel',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      color: Color.fromRGBO(128, 184, 228, 1))),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                width: 60,
                                height: 70,
                                color: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // IntrinsicHeight(
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [
                    //       Container(
                    //         width: 60,
                    //         height: 50,
                    //         color: Colors.grey,
                    //       ),
                    //       VerticalDivider(
                    //         width:100,
                    //         thickness: 2,
                    //         color: Color.fromRGBO(128, 184, 228, 1),
                    //       ),
                    //       Container(
                    //         width: 60,
                    //         height: 50,
                    //         color: Colors.grey,
                    //       ),
                    //     ],
                    //   ),
                    // )
                  ],
                ),
              ),
              SizedBox(height: 20),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return OwnerFuelStatus();
                    }));
                  },
                  child: Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                          child: Text(
                        "Check fuel status",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ))))
            ],
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(62, 102, 208, 1),
    );
  }
}
