import 'package:flutter/material.dart';
import 'package:g_pay/wanted.dart';
import 'package:lottie/lottie.dart';
import 'package:intl/intl.dart';

class Sixth extends StatefulWidget {
  const Sixth(
      {Key? key, required this.name, required this.upi, required this.money})
      : super(key: key);

  final String name;
  final String upi;
  final String money;

  @override
  State<Sixth> createState() => _SixthState();
}

class _SixthState extends State<Sixth> {
  var _loaded = false;
  String date = DateFormat("dd, MMMM, yyyy").format(DateTime.now());
  String time = DateFormat("HH:mm:ss").format(DateTime.now());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _loaded = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_loaded == false) {
      return Scaffold(
        body: Center(
          child: Lottie.asset('images/anime.json', repeat: false),
        ),
      );
    } else {
      return Scaffold(
        body: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
              ),
              Center(
                child: Image(
                  image: AssetImage("images/tick.jpg"),
                  height: 100,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Text(
                '₹${widget.money}.00',
                style: TextStyle(fontSize: 35),
              ),
              SizedBox(
                height: 30,
              ),
              Text('Paid to ${widget.name}'),
              SizedBox(
                height: 10,
              ),
              Text('${widget.upi}'),
              SizedBox(
                height: 180,
              ),
              Text(
                ' ${date.replaceAll(",", "  ")}    ${time.substring(0, 5)}',
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                height: 30,
                width: 75,
                child: Center(
                  child: Text(
                    'Got it',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ],
          ),
        ),
      );
    }
  }
}
