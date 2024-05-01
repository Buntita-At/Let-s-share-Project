import 'dart:html';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lets_share/loginfuntion/singup.dart';
import 'package:lets_share/spiltbill/result.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: GNav(
        backgroundColor: Color.fromARGB(255, 243, 201, 215),
        activeColor: Colors.white,
        tabBackgroundColor: Color.fromARGB(255, 243, 158, 186),
        color: Colors.black,
        gap: 8,
        padding: EdgeInsets.all(15),
        tabs: const [
          GButton(
            icon: Icons.home,
            text: "HOME",
          ),
          GButton(
            icon: Icons.add,
            text: "ADD",
          ),
        ],
      ),
      body: BillSplit(),
    );
  }
}

class BillSplit extends StatefulWidget {
  @override
  _BillSplitState createState() => _BillSplitState();
}

class _BillSplitState extends State<BillSplit> {
  String bill = '';
  double friendsValue = 0.0;
  buildButton(String text) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(padding: EdgeInsets.all(20)),
        onPressed: () {
          if (text == '-') {
            setState(() {
              bill = '';
            });
          } else {
            setState(() {
              bill += text;
            });
          }
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }

  TextStyle infoStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(top: 50),
              child: Text(
                "Split Bill",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 251, 181, 205),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          bill,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Friends", style: infoStyle),
                          ],
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(friendsValue.round().toString(),
                                style: infoStyle),
                            Text("14 %", style: infoStyle),
                            Text("Friends", style: infoStyle),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(
              "How many friends?",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Slider(
              min: 0,
              max: 15,
              divisions: 15,
              activeColor: Color.fromARGB(255, 254, 135, 175),
              inactiveColor: Color.fromARGB(255, 251, 183, 206),
              value: friendsValue,
              onChanged: (value) {
                setState(() {
                  friendsValue = value;
                });
              },
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Calculate',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
              ],
            ),
            Row(
              children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
              ],
            ),
            Row(
              children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
              ],
            ),
            Row(
              children: [
                buildButton("."),
                buildButton("0"),
                buildButton("-"),
              ],
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 92, 166, 227),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(bill, friendsValue),
                  ),
                );
              },
              child: Center(
                child: Text(
                  "Split Bill",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                    color: const Color.fromARGB(255, 202, 223, 241),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
