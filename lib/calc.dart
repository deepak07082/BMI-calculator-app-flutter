import 'package:rflutter_alert/rflutter_alert.dart';

import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _height;
  var _weight;
  var bmi;
  String status;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/bg.png"), fit: BoxFit.fill),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: size.height * 0.10,
                ),
                Center(
                  child: Text(
                    "BMI Calculator",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.10,
                ),
                Container(
                  padding: EdgeInsets.only(
                    top: size.height * 0.05,
                    left: size.width * 0.06,
                    right: size.width * 0.06,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Height:",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Color(0xFFDCDADA),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: TextFormField(
                          onChanged: (height) {
                            setState(() {
                              _height = int.parse(height);
                            });
                          },
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Height In CM",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.all(15)),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.08,
                      ),
                      Text(
                        "weight:",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                        height: size.height * 0.06,
                        decoration: BoxDecoration(
                          color: Color(0xFFDCDADA),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: Offset(0, 1),
                            )
                          ],
                        ),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          onChanged: (weight) {
                            setState(() {
                              _weight = int.parse(weight);
                            });
                          },
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "weight In KG",
                              hintStyle: TextStyle(
                                fontSize: 14,
                              ),
                              contentPadding: EdgeInsets.all(15)),
                        ),
                      ),
                      SizedBox(
                        height: size.height * 0.11,
                      ),
                      Container(
                        child: InkWell(
                          onTap: () {
                            setState(
                              () {
                                try {
                                  bmi = (_weight /
                                          ((_height / 100) * (_height / 100)))
                                      .toInt();
                                  if (bmi >= 18.5 && bmi <= 25) {
                                    status = "Normal BMI";
                                  } else if (bmi > 25 && bmi <= 30) {
                                    status = "Overweight";
                                  } else if (bmi > 30) {
                                    status = "Obesity";
                                  } else {
                                    status = "Under Weight";
                                  }
                                  print("$status");
                                  print("$bmi");
                                  bmiresult(context);
                                } catch (e) {
                                  error(context);
                                }
                              },
                            );
                          },
                          child: Container(
                            height: size.height * 0.07,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFA557FF),
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: Offset(0, 1),
                                )
                              ],
                            ),
                            child: Center(
                              child: Text(
                                "Calculate",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  bmiresult(context) {
    Alert(
        context: context,
        title: "Result",
        content: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text("BMI:"),
            SizedBox(
              height: 5,
            ),
            Text(
              "$bmi",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(
              height: 15,
            ),
            Text("Status:"),
            SizedBox(
              height: 5,
            ),
            Text(
              "$status",
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Color(0xFFA557FF),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Ok!",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )
        ]).show();
  }

  error(context) {
    Alert(
        context: context,
        title: "Oops..",
        content: Column(
          children: <Widget>[
            SizedBox(
              height: 5,
            ),
            Text("Please Enter vaild Height and Weight"),
            SizedBox(
              height: 5,
            ),
          ],
        ),
        buttons: [
          DialogButton(
            color: Color(0xFFA557FF),
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Ok!",
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
          )
        ]).show();
  }
}
