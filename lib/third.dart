import 'package:flutter/material.dart';
import 'package:g_pay/forth.dart';

class Third extends StatefulWidget {
  const Third({Key? key, required this.qr}) : super(key: key);
  final String qr;
  @override
  State<Third> createState() => _ThirdState();
}

class _ThirdState extends State<Third> {
  var pa = <String>[];
  var pn = <String>[];
  String name = "";
  String upi = "";
  final moneycontroller = TextEditingController();
  late Stream<String> money = (() async* {
    await Future<void>.delayed(Duration(milliseconds: 2));
    for (int i = 1; i <= 500; i++) {
      await Future<void>.delayed(Duration(milliseconds: 100));
      yield moneycontroller.text;
    }
  })();

  _decode() {
    String a = widget.qr;
    var ina = false;
    var inn = false;
    for (int i = 0; i < a.length; i++) {
      if (a[i] == "?" &&
          a[i + 1] == "p" &&
          a[i + 2] == "a" &&
          a[i + 3] == "=") {
        i = i + 3;
        ina = true;
        continue;
      }
      if (a[i] == "&" &&
          a[i + 1] == "p" &&
          a[i + 2] == "n" &&
          a[i + 3] == "=") {
        i = i + 3;
        ina = false;
        inn = true;
        continue;
      }
      if (a[i] == "&" && inn == true) {
        i = i + 3;
        ina = false;
        inn = false;
        break;
      }
      if (a[i] == "%" && a[i + 1] == "2" && a[i + 2] == "0") {
        i = i + 2;
        pn.add(" ");
        continue;
      }

      if (ina == true) {
        pa.add(a[i]);
      }

      if (inn == true) {
        pn.add(a[i]);
      }
    }
    name = pn.join();
    upi = pa.join();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _decode();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    moneycontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
      body: Container(
        child: Column(
          children: [
            Flexible(child: Container()),
            CircleAvatar(
              backgroundColor: Colors.green[900],
              child: Text(
                pn[0],
                style: TextStyle(fontSize: 30),
              ),
              radius: 30,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Paying ${name}",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text("${upi}"),
            SizedBox(
              height: 20,
            ),
            Stack(children: [
              Center(
                child: Container(
                  color: Colors.white,
                  width: 100,
                  child: TextField(
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.white,
                      controller: moneycontroller,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      )),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.currency_rupee,
                  ),
                  StreamBuilder(
                    stream: money,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Text("");
                      } else if (snapshot.connectionState ==
                          ConnectionState.active) {
                        return Text(
                          "${snapshot.data}",
                          style: TextStyle(fontSize: 60),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.none) {
                        return Text("");
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        return Text("");
                      } else {
                        return Text("");
                      }
                    },
                  ),
                ],
              ),
            ]),
            Flexible(child: Container()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Forth(
                      name: name, upi: upi, money: moneycontroller.text)));
        },
      ),
    );
  }
}
