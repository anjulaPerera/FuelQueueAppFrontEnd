import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/owner_features/owner_dashboard.dart';

import 'package:fuel/user_features/user_queue_status.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class OwnerFuelStatus extends StatefulWidget {
  const OwnerFuelStatus({Key? key}) : super(key: key);

  @override
  State<OwnerFuelStatus> createState() => _OwnerFuelStatusState();
}

class _OwnerFuelStatusState extends State<OwnerFuelStatus> {
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
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text('Fuel Status',
                        style: TextStyle(
                            fontSize: 30.0,
                            color: Color.fromRGBO(128, 184, 228, 1),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                    SizedBox(
                      height: 10,
                    ),
                    Image(
                      image: AssetImage('assets/fuel.jpg'),
                      height: 90,
                      width: 90,
                    ),
                    Text('petrol',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Color.fromRGBO(128, 184, 228, 1),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.4,
                          progressColor: Color.fromRGBO(128, 184, 228, 1),
                          backgroundColor: Colors.lightBlue,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '92\noct',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        // VerticalDivider(
                        //   width:100,
                        //   thickness: 2,
                        //   color: Color.fromRGBO(128, 184, 228, 1),
                        // ),
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.4,
                          progressColor: Color.fromRGBO(128, 184, 228, 1),
                          backgroundColor: Colors.lightBlue,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            '95\noct',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Diesel',
                        style: TextStyle(
                            fontSize: 25.0,
                            color: Color.fromRGBO(128, 184, 228, 1),
                            fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.4,
                          progressColor: Color.fromRGBO(128, 184, 228, 1),
                          backgroundColor: Colors.lightBlue,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            'Diesel',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        // VerticalDivider(
                        //   width:100,
                        //   thickness: 2,
                        //   color: Color.fromRGBO(128, 184, 228, 1),
                        // ),
                        CircularPercentIndicator(
                          radius: 50,
                          lineWidth: 15,
                          percent: 0.4,
                          progressColor: Color.fromRGBO(128, 184, 228, 1),
                          backgroundColor: Colors.lightBlue,
                          circularStrokeCap: CircularStrokeCap.round,
                          center: Text(
                            'Super\nDiesel',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
                  ],
                ),
                width: screenwidth * .8,
                height: screenheight * .7,
                //color: Colors.white,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30.0)),
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return UserQueueStatus();
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
                        "Check the queue status",
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
