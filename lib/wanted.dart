import 'package:flutter/material.dart';
import 'package:g_pay/sixth.dart';

import 'fifth.dart';

class wanted extends StatefulWidget {
  const wanted(
      {Key? key,
      required this.name,
      required this.upi,
      required this.money,
      required this.First})
      : super(key: key);
  final String name;
  final String upi;
  final String money;
  final bool First;
  @override
  State<wanted> createState() => _wantedState();
}

class _wantedState extends State<wanted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
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
              initialChildSize: 0.15,
              maxChildSize: 0.15,
              minChildSize: 0.15,
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
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        if(widget.First == true){
                          Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>Fifth(
                                  name: widget.name, upi: widget.upi, money: widget.money))
                              );
                        }else{
                          Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Sixth(
                                    name: widget.name,
                                    money: widget.money,
                                    upi: widget.upi,
                                  )));
                        }
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          CircularProgressIndicator(
                            color: Color.fromARGB(255, 19, 95, 157),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text('Paying securely with Google pay')
                        ],
                      ),
                    ),
                  ),
                );
              })
        ],
      ),
    );
  }
}
