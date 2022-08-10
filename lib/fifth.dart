import 'dart:async';

import 'package:flutter/material.dart';
import 'package:g_pay/sixth.dart';
import 'package:g_pay/wanted.dart';

class Fifth extends StatefulWidget {
  const Fifth(
      {Key? key, required this.name, required this.upi, required this.money})
      : super(key: key);
  final String name;
  final String upi;
  final String money;
  @override
  State<Fifth> createState() => _FifthState();
}

class _FifthState extends State<Fifth> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(width: 30),
                  Column(
                    children: [Text('Indian Bank'), Text('xxxx7568')],
                  ),
                  Expanded(child: Container()),
                  Container(
                    width: 100,
                    child: Image(image: AssetImage("images/upi.png")),
                  ),
                  SizedBox(
                    width: 20,
                  )
                ],
              ),
              Container(
                height: 39,
                color: Colors.grey.shade400,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Sending ₹ ${widget.money}',
                      style: TextStyle(fontSize: 18),
                    ),
                    Expanded(child: Container()),
                    Text('To:${widget.name.substring(0, 7)}...'),
                    Icon(Icons.expand_more),
                    SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text('ENTER 4 DIGIT UPI PIN'),
              SizedBox(
                height: 50,
              ),
              Entered(count: count),
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Container(
                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                height: 50,
                width: 375,
                child: Row(children: [
                  Icon(
                    Icons.error_rounded,
                    color: Colors.orange,
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                          'You are transferring money from your account to ${widget.name}'),
                    ),
                  )
                ]),
              )),
              Expanded(child: Container()),
              InkWell(
                  onTap: () {
                    setState(() {
                      count = count + 1;
                    });
                    if (count >= 5) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => wanted(
                                    name: widget.name,
                                    money: widget.money,
                                    upi: widget.upi,
                                    First: false,
                                  )));
                    }
                  },
                  child: Image(image: AssetImage("images/pin.jpeg")))
            ],
          ),
        ),
      ),
    );
  }
}

class Entered extends StatelessWidget {
  const Entered({Key? key, required this.count}) : super(key: key);
  final int count;
  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size.width;
    if (count == 0) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              color: Colors.black,
              width: a / 6,
              height: 3,
            ),
            Container(
              color: Colors.grey,
              width: a / 6,
              height: 3,
            ),
            Container(
              color: Colors.grey,
              width: a / 6,
              height: 3,
            ),
            Container(
              color: Colors.grey,
              width: a / 6,
              height: 3,
            ),
          ],
        ),
      );
    } else if (count == 1) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              color: Colors.black,
              width: a / 6,
              height: 3,
            ),
            Container(
              color: Colors.grey,
              width: a / 6,
              height: 3,
            ),
            Container(
              color: Colors.grey,
              width: a / 6,
              height: 3,
            ),
          ],
        ),
      );
    } else if (count == 2) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              color: Colors.black,
              width: a / 6,
              height: 3,
            ),
            Container(
              color: Colors.grey,
              width: a / 6,
              height: 3,
            ),
          ],
        ),
      );
    } else if (count == 3) {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              color: Colors.black,
              width: a / 6,
              height: 3,
            ),
          ],
        ),
      );
    } else {
      return Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
            Container(
              child: CircleAvatar(
                backgroundColor: Color.fromARGB(255, 10, 90, 156),
                radius: 8,
              ),
              width: a / 6,
            ),
          ],
        ),
      );
    }
  }
}
