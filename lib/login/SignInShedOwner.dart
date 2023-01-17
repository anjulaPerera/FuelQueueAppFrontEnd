import 'dart:convert';
import 'package:fuel/owner_features/owner_dashboard.dart';
import 'package:fuel/startup/join_us.dart';
import 'package:fuel/user_features/user_dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class SignInShedOwner extends StatelessWidget {
  const SignInShedOwner({Key? key}) : super(key: key);

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
              return JoinUs();
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
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
              ),
              child: Container(
                  width: 400,
                  height: 300,
                  padding: const EdgeInsets.fromLTRB(10.0, 10, 10, 15),
                  margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  alignment: Alignment.center,
                  child: const Image(image: AssetImage('assets/img 1.jpg'))),
            ),
          ),
          Container(
            child: Card(
              margin: const EdgeInsets.fromLTRB(20, 0, 20, 70),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ClipPath(
                clipper: ShapeBorderClipper(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30))),
                child: Container(
                  height: screenheight * 0.53,
                  decoration: const BoxDecoration(
                    color: Color.fromRGBO(62, 102, 208, 1),
                  ),
                  padding:
                      const EdgeInsets.only(left: 20.0, top: 0.0, bottom: 20.0),
                  alignment: Alignment.centerLeft,
                  child: const MyCustomForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();

  var password = '';
  var email = '';

  loginShedOwner() async {
    var response = await http.post(
      Uri.parse(
          'https://fuelqueueapp-production.up.railway.app/api/v1/loginshedowner'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      print('Success' + response.body.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => OwnerDashboard()));
    } else {
      print('Failed' + response.body.toString());
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 5),
            child: Text(
              "Login as a Station Owner",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            child: TextFormField(
              onChanged: (value) => {email = value},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter correct email';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white,
                      width: 2.0,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 30, 50, 10),
            //padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            child: TextFormField(
              onChanged: (value) => {password = value},
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Invalid Password';
                }
                return null;
              },
              decoration: const InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                fillColor: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 10, 50, 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    style: const ButtonStyle(alignment: Alignment.center),
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password ?',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white,
                          decorationThickness: 2,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(110, 0, 100, 5),
            child: OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: const BorderSide(color: Colors.blueAccent, width: 5),
                  ),
                ),
              ),
              onPressed: () {
                loginShedOwner();
                // if (_formKey.currentState!.validate()){
                //   Navigator.push(context, MaterialPageRoute(builder: (_) => ()));
                // }
              },
              child: const Text(
                "Submit",
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
