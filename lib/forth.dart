import 'package:flutter/material.dart';
import 'package:g_pay/fifth.dart';
import 'package:g_pay/wanted.dart';

class Forth extends StatefulWidget {
  const Forth(
      {Key? key, required this.name, required this.upi, required this.money})
      : super(key: key);
  final String name;
  final String upi;
  final String money;
  @override
  State<Forth> createState() => _ForthState();
}

class _ForthState extends State<Forth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        actions: [
          Icon(
            Icons.error,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.more_vert,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: Container(),
                  flex: 1,
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Text(
                    widget.name[0],
                    style: TextStyle(fontSize: 30),
                  ),
                  radius: 30,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "paying ${widget.name}",
                  style: TextStyle(fontSize: 20),
                ),
                Text("${widget.upi}"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.currency_rupee,
                    ),
                    Text(
                      widget.money,
                      style: TextStyle(fontSize: 60),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey[200]),
                      onPressed: () {},
                      child: Text(
                        "Add a note",
                        style: TextStyle(color: Colors.black54),
                      )),
                ),
                Flexible(
                  child: Container(),
                  flex: 2,
                ),
              ],
            ),
          ),
          DraggableScrollableSheet(
              initialChildSize: 0.28,
              maxChildSize: 0.28,
              minChildSize: 0.28,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, -1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          const Text("CHOOSE AN ACCOUNT TO PAY WITH"),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          SizedBox(width: 30),
                          Container(
                            child:
                                Image(image: AssetImage("images/IB_logo.jpg")),
                            width: 80,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: Colors.black),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Indian Bank ....7568',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text('Savings Account')
                            ],
                          ),
                          Expanded(child: Container()),
                          Icon(Icons.expand_more),
                          SizedBox(width: 30)
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Center(
                        child: Container(
                          width: 330,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(25)),
                            color: Color.fromARGB(255, 0, 136, 248),
                          ),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>wanted(
                                  name: widget.name, upi: widget.upi, money: widget.money, First: true))
                              );
                            },
                            child: Center(
                              child: Text(
                                'Proceed to pay',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'POWERED BY   ',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          Container(
                            height: 27,
                            width: 60,
                            child: Image(image: AssetImage("images/UPI.jpg")),
                          ),
                          Text(
                            "     |",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ),
                          ),
                          Container(
                            height: 27,
                            width: 60,
                            child: Image(image: AssetImage("images/qqqq.png")),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      ),
    );
  }
}
