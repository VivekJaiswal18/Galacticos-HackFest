import 'package:flutter/material.dart';
import 'package:flutter_app/Plantology/dashboard.dart';
import 'package:flutter_app/Plantology/home.dart';
import 'package:flutter_app/Plantology/otp.dart';
import 'package:flutter_app/Plantology/signUp.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: signIn(),
  ));
}

class signIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: 900,
          width: 450,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/image/flower.jpg'))),
          child: Container(
              decoration: BoxDecoration(color: Colors.black87),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        padding: const EdgeInsets.only(top: 50, left: 20),
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
                      padding: EdgeInsets.only(top: 50, left: 130, bottom: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(60, 20),
                            blurRadius: 30,
                            spreadRadius: -30,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: Text(
                        'Log In',
                        style: TextStyle(
                            fontFamily: 'Noto_Serif',
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade300),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 180, right: 50, left: 50),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            blurStyle: BlurStyle.normal,
                            offset: Offset(0, 130),
                            blurRadius: 30,
                            spreadRadius: -40,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            hintText: 'Email or Phone',
                            hintStyle: TextStyle(color: Colors.white30),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text(
                              'Enter Username',
                              style: TextStyle(color: Colors.white70),
                            )),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          top: 20, right: 50, left: 50, bottom: 50),
                      child: TextField(
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(color: Colors.white30),
                            hintText: 'More than 8 alphanumeric characters',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0)),
                            label: const Text(
                              'Enter Password',
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
                              child: Center(
                                child: Text("Done",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: 'Noto_Serif',
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20,
                                        color: Colors.white)),
                              ),
                            ))),
                    Container(
                      padding: EdgeInsets.only(top: 20, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(3, 13),
                            blurRadius: 20,
                            spreadRadius: -10,
                            color: Colors.black38,
                          ),
                        ],
                      ),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => otp()));
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyle(
                              fontFamily: 'Noto_Serif',
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade300),
                        ),
                      ),
                    ),
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
                      padding: EdgeInsets.only(top: 20, left: 80),
                      child: Row(
                        children: [
                          Text(
                            '''Don't have an account ?''',
                            style: TextStyle(
                                fontFamily: 'Noto_Serif',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade300),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => signUp()));
                            },
                            child: Text(
                              'Sign Up',
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
