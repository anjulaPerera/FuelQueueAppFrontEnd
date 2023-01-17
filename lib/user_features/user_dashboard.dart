import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/startup/neaarest_station.dart';
import 'package:fuel/user_features/user_fuel_status.dart';
import 'package:fuel/user_features/user_queue_status.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({Key? key}) : super(key: key);

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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text('FUEL QUEUE \n  HANDLER',
                  style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline)),
              const SizedBox(
                height: 30,
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //SizedBox(width: 30,),
                    // TextButton(
                    //   onPressed: (){},
                    //   child: Container(
                    //     child: Column(
                    //       children: [
                    //         SizedBox(height: 20),
                    //         Image(image: AssetImage('assets/update.jpg') , height: 100, width: 100,),
                    //         // Container(
                    //         //   height: 100,
                    //         //     width: 100,
                    //         //     color: Colors.black,
                    //         //     child:Image(image: AssetImage('assets/update.jpg'))),
                    //         SizedBox(height: 20),
                    //         Text('Update Details' , style: TextStyle(fontSize: 20.0 , color: Color.fromRGBO(128, 184, 228, 1) , fontWeight: FontWeight.bold))
                    //       ],
                    //     ),
                    //     width: 170,
                    //     height: 170,
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return const UserQueueStatus();
                        }));
                      },
                      child: Container(
                        child: Column(
                          children: const [
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
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return const UserFuelStatus();
                        }));
                      },
                      child: Container(
                        child: Column(
                          children: const [
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
                                    fontWeight: FontWeight.bold)),
                            SizedBox(
                              width: 30,
                            ),
                          ],
                        ),
                        width: 170,
                        height: 170,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return const UserQueueStatus();
                        }));
                      },
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Container(
                              height: 100,
                              width: 100,
                              // color: Colors.blue,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.location_on,
                                  size: 70,
                                ),
                                onPressed: () {
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (builder) {
                                    return const NearestLocation();
                                  }));
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Text('Nearest Location',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromRGBO(128, 184, 228, 1),
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        width: 170,
                        height: 170,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(30.0)),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          )
        ],
      ),
      backgroundColor: const Color.fromRGBO(62, 102, 208, 1),
    );
  }
}
