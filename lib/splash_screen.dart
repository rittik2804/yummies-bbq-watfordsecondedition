import 'dart:async';

import 'package:flutter/material.dart';

import 'home_screen.dart';

// ignore: camel_case_types
class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

// ignore: camel_case_types
class _splash_screenState extends State<splash_screen> {
  double _initial = 0.0;

  void update() {
    Timer.periodic(Duration(milliseconds: 600), (timer) {
      setState(() {
        _initial = _initial + 0.4;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _navigatetohomescreen();
    update();
  }

  _navigatetohomescreen() async {
    await Future.delayed(const Duration(milliseconds: 1800), () {});
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: "Yummies BBQ Watford",
                )));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(top: 55),
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/logo.jpg'),
                        scale: 3,
                        alignment: Alignment.center))),
          )),
          Expanded(
              child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width / 1.15,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff0a790a),
                            style: BorderStyle.solid,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: LinearProgressIndicator(
                            backgroundColor: Colors.white,
                            valueColor:
                                AlwaysStoppedAnimation(Color(0xff0a790a)),
                            minHeight: size.height / 66,
                            value: _initial),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: size.width / 1.15,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      'Loading please wait...',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          decoration: TextDecoration.none),
                      textAlign: TextAlign.end,
                    ),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
              child: Container(
            height: size.height / 60,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/footer.png'),
                    fit: BoxFit.contain,
                    alignment: Alignment.bottomLeft)),
          ))
        ],
      ),
    ));
  }
}
