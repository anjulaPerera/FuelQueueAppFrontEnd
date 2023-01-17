import 'package:flutter/material.dart';
import 'package:fuel/login/SignInShedOwner.dart';
import 'package:fuel/login/SignInUser.dart';
import 'package:widget_mask/widget_mask.dart';

import 'who_are_you.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Stack(children: [
            Column(
              children: [
                Container(
                  width: screenwidth,
                  height: screenheight * 0.4,
                  //color: Colors.pink,
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(62, 102, 208, 1),
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(100.0))),
                ),
                Container(
                    width: screenwidth,
                    height: screenheight * 1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    )),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50),
                  Center(
                    // left: 140,
                    // top: 50,
                    child: Container(
                        height: 70,
                        width: 200,
                        color: Color.fromRGBO(62, 102, 208, 1),
                        child: Center(
                            child: Text(
                          'FUEL QUEUE HANDLER',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ))),
                  ),
                  // SizedBox(height: 30),
                  WidgetMask(
                      blendMode: BlendMode.srcATop,
                      childSaveLayer: true,
                      mask: Image(
                        image: AssetImage('assets/logo.jpg'),
                        width: 400,
                        height: 400,
                      ),
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color.fromRGBO(62, 102, 208, 1),
                        ),
                      )
                      //child: Image(image: AssetImage('assets/logo.jpg') , width: 350, height: 350,))
                      ),
                  // SizedBox(height: 10),
                  Container(
                      height: 190,
                      width: 350,
                      color: Colors.white,
                      child: Center(
                          child: Text(
                              "The purpose of this application is to reduse the queues in fuel stations and save your valuble time. User can enter nearest fuel station and they can get details about fuel status, queue staatus and they can enter a queue using this mobile application.",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.black),
                              textAlign: TextAlign.center))),
                  // SizedBox(height: 10),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return WhoAreYou();
                        }));
                      },
                      child: Container(
                        child: Text('JOIN WITH US',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                            textAlign: TextAlign.center),
                        width: 300.0,
                        height: 50.0,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Color.fromRGBO(62, 102, 208, 1),
                        ),
                      )),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (builder) {
                        return SignInShedOwner();
                      }));
                    },
                    child: Container(
                      child: Text('Already A Station Owner Member ?',
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                          textAlign: TextAlign.center),
                      width: 300.0,
                      height: 50.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromRGBO(62, 102, 208, 1),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (builder) {
                        return SignInUser();
                      }));
                    },
                    child: Container(
                      child: Text('Aleady A Vehicle Owner Member ?',
                          style: TextStyle(fontSize: 17.0, color: Colors.white),
                          textAlign: TextAlign.center),
                      width: 300.0,
                      height: 50.0,
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        color: Color.fromRGBO(62, 102, 208, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ])
        ],
      ),
    );
  }
}
