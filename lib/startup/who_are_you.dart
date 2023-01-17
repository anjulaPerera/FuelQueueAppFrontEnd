import 'package:flutter/material.dart';
import 'package:fuel/signin/signup_owner.dart';
import 'package:fuel/signin/singup_user.dart';
import 'package:fuel/startup/join_us.dart';
import 'package:fuel/startup/shed_count.dart';

class WhoAreYou extends StatelessWidget {
  const WhoAreYou({Key? key}) : super(key: key);

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
              return JoinUs();
            }));
          },
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.menu,size: 30,color: Colors.white,),
          //   onPressed: (){
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //       return NavB();
          //     }));
          //   },
          // ),
        ],
      ),
      body: ListView(
        children: [
          Stack(
            children: [
              Column(
                children: [
                  //SingleChildScrollView(scrollDirection: Axis.horizontal),
                  Container(
                    width: screenwidth,
                    height: screenheight * .4,
                    color: Colors.white,
                  ),
                  Container(
                    width: screenwidth,
                    height: screenheight * .7,
                    //color: Colors.blue,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(62, 102, 208, 1),
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(100.0),
                            bottomLeft: Radius.circular(150.0))),
                  ),
                ],
              ),
              // Container(
              //   width: screenwidth,
              //   height: screenheight*.4,
              //   color: Colors.black,
              //   child: Image(image: AssetImage('assets/conc.jpg')),
              // ),
              Column(
                children: [
                  Container(
                      width: screenwidth,
                      height: 280,
                      child: Image(image: AssetImage('assets/conc.jpg'))),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 40),
                    child: Container(
                      width: 150,
                      height: 30,
                      color: Color.fromRGBO(62, 102, 208, 1),
                      child: Text('ARE YOU?',
                          style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return SignUpOwner();
                        }));
                      },
                      child: Container(
                        child: Text('Shed Owner',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        width: 300.0,
                        height: 50.0,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.white,
                        ),
                      )),
                  SizedBox(height: 20),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (builder) {
                          return SignUpUser();
                        }));
                      },
                      child: Container(
                        child: Text('Regular User',
                            style: TextStyle(
                                fontSize: 25.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center),
                        width: 300.0,
                        height: 50.0,
                        padding: EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
