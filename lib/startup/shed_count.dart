import 'package:flutter/material.dart';
import 'package:fuel/navbar/nav_bar.dart';
import 'package:fuel/signin/signup_owner.dart';
import 'package:fuel/startup/who_are_you.dart';

class ShedCount extends StatefulWidget {
  const ShedCount({Key? key}) : super(key: key);

  @override
  State<ShedCount> createState() => _ShedCountState();
}

class _ShedCountState extends State<ShedCount> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(62, 102, 208, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (builder){
              return WhoAreYou();
            }));
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.menu,size: 30,color: Colors.white,),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
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
                    height: screenheight*.6,
                    //color: Colors.pink,
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(194, 227, 246, 1),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(50.0),
                            bottomLeft: Radius.circular(50.0)
                        )
                    ),
                  ),
                  Container(
                    width: screenwidth,
                    height: screenheight*.4,
                    //color: Colors.blue,
                  ),
                ],
              ),
              Center(
                child: Column(
                  children: [
                    Image(image: AssetImage('assets/logo.jpg') ,width: 350 , height: 350,),
                    // Container(
                    //     width: screenwidth*.8,
                    //     height: screenheight*.5,
                    //     color: Colors.black,
                    //     child: Image(image: AssetImage('assets/loc.jpg'))),
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
                                      child: Text('How many\nSheds\nyou own?' , style: TextStyle(fontSize: 25.0 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center))),
                            ),
                          ),
                          SizedBox(height: 30),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                            child: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter number of your own sheds';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                filled:true,
                                fillColor: Color.fromRGBO(62, 102, 208, 1),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.only(left: 20 , top: 30),
                            child: TextButton(onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                return SignUpOwner();
                              }));
                              if (_formKey.currentState!.validate()) {
                                // If the form is valid, display a snackbar. In the real world,
                                // you'd often call a server or save the information in a database.
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Processing Data')),
                                );
                              } else{
                                Navigator.of(context).push(MaterialPageRoute(builder: (builder){
                                  return SignUpOwner();
                                }));
                              }
                            },
                                child: Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(border: Border.all(color: Colors.white) , borderRadius: BorderRadius.all(Radius.circular(5))),
                                    child: Center(child: Text("Next" , style: TextStyle(color: Colors.white),)))),
                          )
                        ],
                      ),
                      width: screenwidth*.7,
                      height: screenheight*.5,
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
