import 'package:flutter/material.dart';
import 'package:flutter_app/Plantology/signIn.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: home(),
  ));
}

class home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: 450,
          height: 900,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/image/plant.gif'))),
          child: Container(
              decoration: BoxDecoration(color: Colors.black38),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 200, left: 30, bottom: 250),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 50,
                              spreadRadius: 20,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                        child: Text(
                          'PLANT\n-O-\nLOGY',
                          style: TextStyle(
                              fontFamily: 'Noto_Serif',
                              fontSize: 50,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade300),
                        ),
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
                              blurRadius: 70,
                              spreadRadius: 20,
                              color: Colors.black38,
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
                                    builder: (context) => signIn()));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
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
                            child: Text("Get Started",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontFamily: 'Noto_Serif',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20,
                                    color: Colors.white)),
                          ),
                        ))
                  ])),
        ),
      ),
    );
  }
}
