import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
/*import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';*/

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

//Stating Home Page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //const HomePage({super.key});

  String? nameEmail = "";
  String? nameFirst = "";
  String? nameLast = "";
  String final_response = "";

  //construct form
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //SizedBox(
          //  height: 30,
          //),
          Container(
              padding: const EdgeInsets.only(
                top: 30,
              ),
              //decoration: const BoxDecoration(
              //  color: Colors.white,
              // ),
              child: //const Text('img here')),
                  Image.asset(
                'assets/image/logomark.png',
                height: 60,
                fit: BoxFit.cover,
              )),
          SizedBox(height: 10),
          Expanded(
            child: Container(
                padding: const EdgeInsets.all(40),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                    Color.fromARGB(255, 1, 171, 164),
                    Color.fromARGB(255, 36, 151, 193),
                    Color.fromARGB(255, 88, 118, 237)
                  ]),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                ),
                child: Column(
                  children: [
                    Container(
                      child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'What\'s Bicara AI?',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'A mobile app to help people prepare their English Proficiency Test by providing an IELTS Speaking Mock Test / Simulation with lengthy feedback in the area of grammar, fluency and others.',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                          ]),
                    ),
                    Container(
                      child: const Column(children: [
                        Text(
                          'Features and Benefits',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'With 24/7 Personal IELTS Speaking Coach in your fingertips, Bicara AI can boost your confidence affordably',
                          style: TextStyle(fontSize: 14, color: Colors.white),
                          textAlign: TextAlign.center,
                        )
                      ]),
                    ),
                    SizedBox(height: 40),
                    Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 210, 238, 236),
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 15),
                              Text('Log In',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                      color: Color.fromARGB(255, 1, 171, 164))),
                              SizedBox(height: 10),
                              //input email
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  child: Container(
                                    width: 230,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: TextFormField(
                                      controller: emailController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Email",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 20)),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your email';
                                        }
                                        return null;
                                      },
                                      onSaved: (value1) {
                                        nameEmail = value1;
                                      },
                                    ),
                                  )),
                              //input first name
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  child: Container(
                                    width: 230,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: TextFormField(
                                      controller: firstNameController,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: "First Name",
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 15),
                                      ),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your First Name';
                                        }
                                        return null;
                                      },
                                      onSaved: (value2) {
                                        nameFirst = value2;
                                      },
                                    ),
                                  )),
                              //input Last Name
                              Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 6),
                                  child: Container(
                                    width: 230,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                    child: TextFormField(
                                      controller: lastNameController,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          labelText: "Last Name",
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15)),
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter your Last Name';
                                        }
                                        return null;
                                      },
                                      onSaved: (value3) {
                                        nameLast = value3;
                                      },
                                    ),
                                  )),
                              //submit
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 16),
                                child: Center(
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      padding:
                                          MaterialStateProperty.all<EdgeInsets>(
                                              EdgeInsets.all(15.0)),
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color.fromARGB(255, 1, 171, 164)),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(15.0),
                                      )),
                                    ),

                                    onPressed: () async {
                                      if (_formKey.currentState!.validate()) {
                                        //if the form is valid: navigate to home page
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => ThanksPage(
                                                    firstName:
                                                        firstNameController
                                                            .text,
                                                  )),
                                        );

                                        _formKey.currentState?.save();

                                        //final url = 'http://127.0.0.1:5000';
                                        final url =
                                            'http://127.0.0.1:5000/name';

                                        String urlString =
                                            "http://192.168.0.100:5000/name"; // Replace with your URL
                                        Uri uri = Uri.parse(urlString);
                                        String request = 'POST';
                                        final response = await http.post(uri,
                                            body: json.encode({
                                              'email': emailController.text,
                                              'firstName':
                                                  firstNameController.text,
                                              'lastName':
                                                  lastNameController.text,
                                            }));
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                              content:
                                                  Text('Please fill input')),
                                        );
                                      }
                                    }, //on pressed
                                    child: const Text(
                                      'Submit',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

// login page

class ThanksPage extends StatelessWidget {
  const ThanksPage({super.key, required this.firstName});

  final String firstName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(25),
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
                Color.fromARGB(255, 1, 171, 164),
                Color.fromARGB(255, 36, 151, 193),
                Color.fromARGB(255, 88, 118, 237)
              ]),
            ),
            //border: Border.all(color: Colors.red)),
            child: Column(
              children: [
                SizedBox(height: 30),
                Text(
                  'Thank You for Signing Up!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 28,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Hello, ' + firstName + '!',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  'Welcome to Bicara AI',
                  style: TextStyle(
                      //fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                )
              ],
            )));
  }
}
