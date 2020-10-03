import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyAnimationPage(),
    );
  }
}

class MyAnimationPage extends StatefulWidget {
  @override
  _MyAnimationPageState createState() => _MyAnimationPageState();
}

class _MyAnimationPageState extends State<MyAnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var myAnimation, i;
  var animationCounter = 1.0;
  var animationCountereye = 1.0;
  var mouthheightsmile = 30;
  var colorBlack = Colors.black;
  var colorWhite = Colors.white;
  bool eyeopen = true,
      mouthDefault = true,
      cryingface = false,
      angryFace = false;
  var eyeAnimation;
  var mouthwidth = 80, mouthheight = 15;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(
          seconds: 1,
        ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        leading: Icon(FontAwesomeIcons.solidHandPointRight),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 500,
                  height: 180,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: angryFace
                        ? LinearGradient(
                            colors: [
                                Color.fromRGBO(255, 235, 238, 1.0),
                                Colors.red[800],
                                Color.fromRGBO(211, 47, 47, 1.0),
                              ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                        : LinearGradient(
                            colors: [
                                Colors.black45,
                                Colors.black,
                              ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                    //color: angryFace ? null : colorBlack,
                  ),
                  //color: Colors.black,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // ** Eye part Start Here !!
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                              width: 20,
                              height: 15,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.all(
                                    Radius.elliptical(150, 50)),
                              ),
                              child: Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: eyeopen ? colorBlack : colorWhite,
                                  ),
                                  width: 8,
                                  height: 8,
                                  child: Transform.translate(
                                    offset: cryingface
                                        ? Offset(0 * animationCountereye,
                                            50 * animationCountereye)
                                        : Offset(0, 0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: cryingface
                                            ? Colors.blue
                                            : Colors.black,
                                      ),
                                      transform: null,
                                    ),
                                  ),
                                ),
                              )),
                          SizedBox(
                            width: 80,
                          ),
                          Container(
                            width: 20,
                            height: 15,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.elliptical(150, 50)),
                            ),
                            child: Center(
                                child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: eyeopen ? colorBlack : colorWhite,
                              ),
                              width: 8,
                              height: 8,
                              child: Transform.translate(
                                offset: cryingface
                                    ? Offset(0 * animationCountereye,
                                        50 * animationCountereye)
                                    : Offset(0, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color:
                                        cryingface ? Colors.blue : Colors.black,
                                  ),
                                  transform: null,
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                      // ** Eye part End Here !!
                      SizedBox(
                        height: 10,
                      ),
                      // ** Nose part Start Here !!
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(50),
                              bottomRight: Radius.circular(50),
                            )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                )),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.black,
                                )),
                          ],
                        ),
                      ),
                      // ** Nose part End tHere !!
                      SizedBox(
                        height: 10,
                      ),
                      // ** Mouth part Start Here !!
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        width: mouthDefault
                            ? mouthwidth.toDouble()
                            : 140 * animationCounter ?? 140,
                        height: mouthDefault
                            ? mouthheight.toDouble()
                            : mouthheightsmile.toDouble() * animationCounter ??
                                30,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: mouthDefault
                                ? BorderRadius.circular(5)
                                : angryFace
                                    ? BorderRadius.only(
                                        bottomLeft: Radius.circular(20),
                                        bottomRight: Radius.circular(20),
                                        topLeft: Radius.circular(70),
                                        topRight: Radius.circular(70))
                                    : BorderRadius.only(
                                        bottomLeft: Radius.circular(70),
                                        bottomRight: Radius.circular(70),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20))),
                        // child: mouthDefault
                        //     ? null
                        //     : Row(
                        //         children: [
                        //           Container(
                        //             color: Colors.white,
                        //             width: 40,
                        //             height: 10,
                        //           )
                        //         ],
                        //       ),
                      ),
                      // ** Mouth part End Here !!
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          // ? Button Start Here!!
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text("Smile Face"),
                  elevation: 5.0,
                  focusColor: Colors.red,
                  fillColor: Colors.yellow,
                  onPressed: () {
                    _controller.reverse();
                    cryingface = false;
                    angryFace = false;
                    mouthDefault = false;
                    setState(() {
                      mouthheightsmile = 30;
                    });
                    myAnimation = CurvedAnimation(
                        parent: _controller, curve: Curves.easeInCirc)
                      ..addListener(() {
                        setState(() {
                          animationCounter = myAnimation.value;
                        });
                      });
                    _controller.forward();
                    setState(() {
                      eyeopen = false;
                    });
                  },
                ),
                SizedBox(
                  width: 6,
                ),
                RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text("Cry Face"),
                  elevation: 5.0,
                  focusColor: Colors.red,
                  fillColor: Colors.yellow,
                  onPressed: () {
                    cryingface = true;
                    mouthDefault = true;
                    angryFace = false;
                    setState(() {
                      mouthwidth = 50;
                      mouthheight = 15;
                    });

                    myAnimation = CurvedAnimation(
                        parent: _controller, curve: Curves.easeInCirc)
                      ..addListener(() {
                        setState(() {
                          animationCountereye = myAnimation.value;
                        });
                      });
                    _controller.repeat();
                    setState(() {
                      eyeopen = false;
                    });
                  },
                ),
                SizedBox(
                  width: 6,
                ),
                RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text("Angry Face"),
                  elevation: 5.0,
                  focusColor: Colors.red,
                  fillColor: Colors.yellow,
                  onPressed: () {
                    _controller.reverse();
                    setState(() {
                      angryFace = true;
                    });
                    mouthDefault = false;
                    cryingface = false;
                    setState(() {
                      // mouthwidth = 50;
                      // mouthheight = 5;
                      mouthheightsmile = 10;
                    });
                    myAnimation = CurvedAnimation(
                        parent: _controller, curve: Curves.easeInCirc)
                      ..addListener(() {
                        setState(() {
                          animationCounter = myAnimation.value;
                        });
                      });
                    _controller.forward();
                  },
                ),
                SizedBox(
                  width: 6,
                ),
                RawMaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7)),
                  child: Text("Normal Face"),
                  elevation: 5.0,
                  focusColor: Colors.red,
                  fillColor: Colors.yellow,
                  onPressed: () {
                    angryFace = false;
                    cryingface = false;
                    _controller.reverse();
                    setState(() {
                      mouthwidth = 80;
                      mouthheight = 15;
                    });
                    setState(() {
                      eyeopen = true;
                    });
                    mouthDefault = true;
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    ));
  }
}
