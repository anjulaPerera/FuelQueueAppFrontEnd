import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/owner_features/update_details.dart';
import 'package:fuel/startup/neaarest_station.dart';
import 'package:fuel/startup/suggesions.dart';
import 'package:fuel/user_features/user_queue_status.dart';

class OwnerDashboard extends StatelessWidget {
  OwnerDashboard({Key? key}) : super(key: key);
  var sheds = [];

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
              return Suggesions(sheds: sheds);
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('FUEL QUEUE \n  HANDLER',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return UpdateDetails();
                        }));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Image(
                              image: AssetImage('assets/update.jpg'),
                              height: 100,
                              width: 100,
                            ),
                            // Container(
                            //   height: 100,
                            //     width: 100,
                            //     color: Colors.black,
                            //     child:Image(image: AssetImage('assets/update.jpg'))),
                            SizedBox(height: 20),
                            Text('Update Details',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(128, 184, 228, 1),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return UserQueueStatus();
                        }));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Image(
                              image: AssetImage('assets/que.jpg'),
                              height: 100,
                              width: 100,
                            ),
                            // Container(
                            //     height: 100,
                            //     width: 100,
                            //     color: Colors.black,
                            //     child:Text('Hello')), //Image(image: AssetImage('assets/update.jpg'))),
                            SizedBox(height: 20),
                            Text('Queue Status',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(128, 184, 228, 1),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Image(
                              image: AssetImage('assets/fuel.jpg'),
                              height: 100,
                              width: 100,
                            ),
                            // Container(
                            //     height: 100,
                            //     width: 100,
                            //     color: Colors.black,
                            //     child:Text('Hello')), //Image(image: AssetImage('assets/update.jpg'))),
                            SizedBox(height: 20),
                            Text('Fuel Status',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(128, 184, 228, 1),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        width: 170,
                        height: 170,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 70, left: 30),
                      child: Row(
                        children: [
                          Text('Shed Name :',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          Container(
                            width: 150,
                            height: 20,
                            child: Text('ABC Fuel Station pvt ltd',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),

                            // color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Row(
                        children: [
                          Text('Owner Name :',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          Container(
                            width: 150,
                            height: 20,
                            child: Text('Kasthuri Gamage',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            // color: Colors.black,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 30),
                      child: Row(
                        children: [
                          Text('City :',
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white)),
                          Container(
                            width: 150,
                            height: 20,
                            child: Text('Galle',
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white)),
                            // color: Colors.black,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                width: screenwidth * .8,
                height: screenheight * .4,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(70.0)),
                  color: Color.fromRGBO(62, 102, 208, 1),
                ),
              )
            ],
          )
        ],
      ),
      backgroundColor: Color.fromRGBO(62, 102, 208, 1),
    );
  }
}
