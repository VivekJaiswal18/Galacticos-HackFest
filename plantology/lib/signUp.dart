import 'package:flutter/material.dart';
import 'package:flutter_app/Plantology/dashboard.dart';
import 'package:flutter_app/Plantology/home.dart';
import 'package:flutter_app/Plantology/signIn.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: signUp(),
  ));
}

class signUp extends StatelessWidget {
  bool value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 867,
          width: 420,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/plant2.jpg'))),
          child: Container(
              decoration: BoxDecoration(color: Colors.black54),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(10, 30),
                              blurRadius: 40,
                              spreadRadius: -25,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        padding: const EdgeInsets.only(top: 50, left: 20),
                        child: TextButton.icon(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home()));
                            },
                            icon:
                                Icon(Icons.arrow_back_ios, color: Colors.green),
                            label: Text(
                              'Home',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ))),
                    Container(
                      padding: EdgeInsets.only(top: 40, left: 30, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(17, 20),
                            blurRadius: 40,
                            spreadRadius: -10,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            fontFamily: 'Noto_Serif',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade300),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 80, right: 50, left: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 40),
                            blurRadius: 30,
                            spreadRadius: -45,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            hintText: 'Enter name',
                            hintStyle: TextStyle(color: Colors.white30),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text(
                              'Name',
                              style: TextStyle(color: Colors.white70),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 50, left: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 35,
                            spreadRadius: -10,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: 'Enter email',
                            hintStyle: TextStyle(color: Colors.white30),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text(
                              'Email',
                              style: TextStyle(color: Colors.white70),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20, right: 50, left: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 10),
                            blurRadius: 35,
                            spreadRadius: -10,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            hintText: 'Enter phone number',
                            hintStyle: TextStyle(color: Colors.white30),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text(
                              'Phone',
                              style: TextStyle(color: Colors.white70),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, right: 50, left: 50, bottom: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, -15),
                            blurRadius: 30,
                            spreadRadius: -40,
                            color: Colors.black38,
                          )
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white30),
                            hintText: 'More than 8 alphanumeric characters',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text(
                              'Create Password',
                              style: TextStyle(color: Colors.white70),
                            )),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 50, right: 50),
                        height: 70,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              offset: Offset.zero,
                              blurRadius: 90,
                              spreadRadius: -10,
                              color: Colors.black,
                            ),
                          ],
                        ),
                        child: MaterialButton(
                          color: Colors.green.shade900,
                          elevation: 30,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => dashboard()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 0),
                                  blurRadius: 40,
                                  spreadRadius: -30,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                            child: Text("Done",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Noto_Serif',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                        )),
                    Container(
                      padding: EdgeInsets.only(top: 30, left: 80),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(80, 35),
                                  blurRadius: 30,
                                  spreadRadius: 10,
                                  color: Colors.black38,
                                ),
                              ],
                            ),
                            child: Text(
                              '''Already have an account ?''',
                              style: TextStyle(
                                  fontFamily: 'Noto_Serif',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade300),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signIn()));
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                  fontFamily: 'Noto_Serif',
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green.shade300),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ])),
        ),
      ),
    );
  }
}
