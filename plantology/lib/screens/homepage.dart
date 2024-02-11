import 'dart:io';

import 'package:gpt_vision_leaf_detect/market.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gpt_vision_leaf_detect/constants/constants.dart';
import 'package:image_picker/image_picker.dart';

import '../services/api_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
  final apiService = ApiService();
  File? _selectedImage;
  String diseaseName = '';
  String diseasePrecautions = '';
  bool detecting = false;
  bool precautionLoading = false;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile =
        await ImagePicker().pickImage(source: source, imageQuality: 50);
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  detectDisease() async {
    setState(() {
      detecting = true;
    });
    try {
      diseaseName =
          await apiService.sendImageToGPT4Vision(image: _selectedImage!);
    } catch (error) {
      _showErrorSnackBar(error);
    } finally {
      setState(() {
        detecting = false;
      });
    }
  }

  showPrecautions() async {
    setState(() {
      precautionLoading = true;
    });
    try {
      if (diseasePrecautions == '') {
        diseasePrecautions =
            await apiService.sendMessageGPT(diseaseName: diseaseName);
      }
      _showSuccessDialog(diseaseName, diseasePrecautions);
    } catch (error) {
      _showErrorSnackBar(error);
    } finally {
      setState(() {
        precautionLoading = false;
      });
    }
  }

  void _showErrorSnackBar(Object error) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(error.toString()),
      backgroundColor: Colors.red,
    ));
  }

  void _showSuccessDialog(String title, String content) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.rightSlide,
      title: title,
      desc: content,
      btnOkText: 'Got it',
      btnOkColor: themeColor,
      btnOkOnPress: () {},
    ).show();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            SingleChildScrollView(
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
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
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
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 20),
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
                                          backgroundBlendMode:
                                              BlendMode.hardLight,
                                          borderRadius:
                                              BorderRadius.circular(13),
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
                                              padding:
                                                  EdgeInsets.only(top: 120),
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
                                          backgroundBlendMode:
                                              BlendMode.hardLight,
                                          color: Colors.white38,
                                          borderRadius:
                                              BorderRadius.circular(13),
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
                                              padding:
                                                  EdgeInsets.only(top: 120),
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
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          backgroundBlendMode:
                                              BlendMode.hardLight,
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
                                              padding:
                                                  EdgeInsets.only(top: 120),
                                              child: Text(
                                                'The Hindu',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Nunito',
                                                    fontWeight: FontWeight.bold,
                                                    color:
                                                        Colors.blue.shade500),
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
                                          backgroundBlendMode:
                                              BlendMode.hardLight,
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          image: DecorationImage(
                                              opacity: 0.5,
                                              scale: 6,
                                              image: AssetImage(
                                                  "assets/image/toi.png")),
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
                                              padding:
                                                  EdgeInsets.only(top: 120),
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
                              style: TextStyle(
                                  color: Colors.white38, fontSize: 20),
                            ),
                          ),
                          Container(
                              padding:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
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
                                          image: AssetImage(
                                              "assets/image/potatoSeed.png")),
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
                                          image: AssetImage(
                                              "assets/image/crop2.png")),
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
                                          image: AssetImage(
                                              "assets/image/crop3.png")),
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
                                          image: AssetImage(
                                              "assets/image/crop4.png")),
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
                              padding: const EdgeInsets.only(
                                  right: 20, left: 20, top: 20),
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
                                          borderRadius:
                                              BorderRadius.circular(13),
                                          boxShadow: [
                                            BoxShadow(
                                              offset: Offset(-40, 0),
                                              blurRadius: 70,
                                              spreadRadius: 5,
                                              color: Color.fromRGBO(
                                                  32, 25, 55, 1.0),
                                            ),
                                          ],
                                        ),
                                        child: IconButton(
                                          iconSize: 30,
                                          icon: const Icon(
                                              Icons.shopping_bag_rounded),
                                          color: Colors.black54,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        market()));
                                          },
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
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
                                          icon: const Icon(
                                              Icons.camera_alt_rounded),
                                          color: Colors.white38,
                                          onPressed: () {
                                            _pickImage(ImageSource.camera);
                                          },
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 70),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(13),
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
            _selectedImage == null
                ? Container(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Image.asset('assets/images/pick1.png'),
                  )
                : Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
            if (_selectedImage != null)
              detecting
                  ? SpinKitWave(
                      color: themeColor,
                      size: 30,
                    )
                  : Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 0, horizontal: 20),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          // Set some horizontal and vertical padding
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(15), // Rounded corners
                          ),
                        ),
                        onPressed: () {
                          detectDisease();
                        },
                        child: const Text(
                          'DETECT',
                          style: TextStyle(
                            color: Colors.white, // Set the text color to white
                            fontSize: 16, // Set the font size
                            fontWeight:
                                FontWeight.bold, // Set the font weight to bold
                          ),
                        ),
                      ),
                    ),
            if (diseaseName != '')
              Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DefaultTextStyle(
                          style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                              fontSize: 16),
                          child: AnimatedTextKit(
                              isRepeatingAnimation: false,
                              repeatForever: false,
                              displayFullTextOnTap: true,
                              totalRepeatCount: 1,
                              animatedTexts: [
                                TyperAnimatedText(
                                  diseaseName.trim(),
                                ),
                              ]),
                        )
                      ],
                    ),
                  ),
                  precautionLoading
                      ? const SpinKitWave(
                          color: Colors.blue,
                          size: 30,
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                          ),
                          onPressed: () {
                            showPrecautions();
                          },
                          child: Text(
                            'PRECAUTION',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),
                        ),
                ],
              ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
