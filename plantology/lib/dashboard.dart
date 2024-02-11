import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app/plantology/market.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: dashboard(),
  ));
}

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  late File _image;
  late List _result;
  bool imageSelect = false;

  void initState() {
    super.initState();
    loadModel();
  }

  Future loadModel() async {
    Tflite.close();
    String res;
    res = (await Tflite.loadModel(
        model: "assets/file/trained_plant_disease_model.tflite",
        labels: "assets/file/treatment.csv"))!;
    print('Model Loding...${res}');
  }

  Future imageClassification(File image) async {
    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 6,
      threshold: 0.05,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    setState(() {
      _result = recognitions!;
      _image = image;
      imageSelect = true;
    });
  }

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
                  fit: BoxFit.fill,
                  image: AssetImage('assets/image/plant.gif'))),
          child: Container(
              decoration: BoxDecoration(color: Colors.black87),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  padding: EdgeInsets.only(top: 60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(5, -10),
                        blurRadius: 50,
                        spreadRadius: 30,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                  child: Text(
                    'PLANT-O-LOGY',
                    style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 20,
                        color: Colors.greenAccent),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 30, left: 30, right: 30, bottom: 10),
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 17),
                          blurRadius: 17,
                          spreadRadius: -10,
                          color: Colors.black54,
                        ),
                      ],
                      color: Colors.grey.shade400,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: Icon(Icons.search_rounded),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Newspaper',
                    style: TextStyle(color: Colors.white38, fontSize: 20),
                  ),
                ),
                Container(
                    height: 150,
                    width: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 40),
                          blurRadius: 100,
                          spreadRadius: -20,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                backgroundBlendMode: BlendMode.hardLight,
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    opacity: 0.7,
                                    scale: 20,
                                    image: AssetImage(
                                        "assets/image/indianExpress.png")),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -10,
                                    color: Colors.red.shade200,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.only(top: 120),
                                    child: Text(
                                      'Indian Express',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red[300]),
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                backgroundBlendMode: BlendMode.hardLight,
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    opacity: 10,
                                    scale: 1,
                                    image: AssetImage(
                                        "assets/image/anandabazar.png")),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -10,
                                    color: Colors.orange.shade200,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.only(top: 120),
                                    child: Text(
                                      'Ananda Bazar',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.orange[500]),
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(13),
                                backgroundBlendMode: BlendMode.hardLight,
                                image: DecorationImage(
                                    opacity: 0.5,
                                    scale: 5,
                                    image: AssetImage(
                                        "assets/image/the hindu.png")),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -10,
                                    color: Colors.blue.shade200,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.only(top: 120),
                                    child: Text(
                                      'The Hindu',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue.shade500),
                                    ),
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 200,
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.white38,
                                backgroundBlendMode: BlendMode.hardLight,
                                borderRadius: BorderRadius.circular(13),
                                image: DecorationImage(
                                    opacity: 0.5,
                                    scale: 6,
                                    image: AssetImage("assets/image/toi.png")),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(0, 17),
                                    blurRadius: 17,
                                    spreadRadius: -10,
                                    color: Colors.red.shade200,
                                  ),
                                ],
                              ),
                              child: InkWell(
                                  onTap: () {},
                                  child: Container(
                                    padding: EdgeInsets.only(top: 120),
                                    child: Text(
                                      'Times of India',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontFamily: 'Nunito',
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red.shade300),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    'Blog',
                    style: TextStyle(color: Colors.white38, fontSize: 20),
                  ),
                ),
                Container(
                    padding: EdgeInsets.only(top: 10, left: 20, right: 20),
                    height: 330,
                    width: 400,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 40),
                          blurRadius: 100,
                          spreadRadius: -20,
                          color: Colors.black,
                        ),
                      ],
                    ),
                    child: GridView.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 50,
                      crossAxisSpacing: 50,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 17,
                                spreadRadius: -10,
                                color: Colors.grey,
                              ),
                            ],
                            color: Colors.grey.shade800,
                            backgroundBlendMode: BlendMode.hardLight,
                            borderRadius: BorderRadius.circular(13),
                            image: DecorationImage(
                                opacity: 0.7,
                                scale: 6,
                                image:
                                    AssetImage("assets/image/potatoSeed.png")),
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(top: 120),
                                child: Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[300]),
                                ),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 17,
                                spreadRadius: -10,
                                color: Colors.grey,
                              ),
                            ],
                            backgroundBlendMode: BlendMode.hardLight,
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(13),
                            image: DecorationImage(
                                opacity: 10,
                                scale: 10,
                                image: AssetImage("assets/image/crop2.png")),
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(top: 120),
                                child: Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.yellow.shade800),
                                ),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 17,
                                spreadRadius: -10,
                                color: Colors.grey,
                              ),
                            ],
                            color: Colors.grey.shade800,
                            borderRadius: BorderRadius.circular(13),
                            backgroundBlendMode: BlendMode.hardLight,
                            image: DecorationImage(
                                opacity: 0.5,
                                scale: 5,
                                image: AssetImage("assets/image/crop3.png")),
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(top: 120),
                                child: Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue.shade500),
                                ),
                              )),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 17,
                                spreadRadius: -10,
                                color: Colors.grey,
                              ),
                            ],
                            color: Colors.grey.shade800,
                            backgroundBlendMode: BlendMode.hardLight,
                            borderRadius: BorderRadius.circular(13),
                            image: DecorationImage(
                                opacity: 0.5,
                                scale: 6,
                                image: AssetImage("assets/image/crop4.png")),
                          ),
                          child: InkWell(
                              onTap: () {},
                              child: Container(
                                padding: EdgeInsets.only(top: 120),
                                child: Text(
                                  '',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Nunito',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red.shade300),
                                ),
                              )),
                        ),
                      ],
                    )),
                Padding(
                    padding:
                        const EdgeInsets.only(right: 20, left: 20, top: 20),
                    child: Container(
                      height: 70,
                      padding: EdgeInsets.only(),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 70),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(-40, 0),
                                    blurRadius: 70,
                                    spreadRadius: 5,
                                    color: Color.fromRGBO(32, 25, 55, 1.0),
                                  ),
                                ],
                              ),
                              child: IconButton(
                                iconSize: 30,
                                icon: const Icon(Icons.shopping_bag_rounded),
                                color: Colors.black54,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => market()));
                                },
                              ),
                            ),
                            (imageSelect)
                                ? Container(
                                    margin: const EdgeInsets.all(10),
                                    child: Image.file(_image),
                                  )
                                : Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(10, 5),
                                          blurRadius: 50,
                                          spreadRadius: 5,
                                          color: Colors.red.shade900,
                                        ),
                                      ],
                                    ),
                                    child: IconButton(
                                      iconSize: 35,
                                      icon:
                                          const Icon(Icons.camera_alt_rounded),
                                      color: Colors.white38,
                                      onPressed: pickImage,
                                      tooltip: 'Select Image',
                                    ),
                                  ),
                            Container(
                              padding: EdgeInsets.only(left: 70),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(13),
                                boxShadow: [
                                  BoxShadow(
                                    offset: Offset(40, 5),
                                    blurRadius: 70,
                                    spreadRadius: 5,
                                    color: Colors.green.shade900,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                iconSize: 30,
                                icon: Icon(Icons.view_list_rounded),
                                color: Colors.black54,
                                onPressed: () {},
                              ),
                            ),
                          ]),
                    ))
              ])),
        ),
      ),
    );
  }

  Future pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File image = File(pickedFile!.path);
    imageClassification(image);
  }
}
