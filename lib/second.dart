import 'dart:io';
import 'dart:core';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:custom_rounded_rectangle_border/custom_rounded_rectangle_border.dart';
import 'package:g_pay/third.dart';
import 'package:scan/scan.dart';

class Second extends StatelessWidget {
  const Second({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.close),
          onTap: () => Navigator.pop(context),
        ),
        actions: [
          Icon(Icons.flashlight_on),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.qr_code_2),
          SizedBox(
            width: 20,
          ),
          Icon(Icons.more_vert_sharp),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          upperSecond(),
          lowerSecond(),
        ],
      ),
    );
  }
}

class lowerSecond extends StatefulWidget {
  const lowerSecond({Key? key}) : super(key: key);

  @override
  State<lowerSecond> createState() => _lowerSecondState();
}

class _lowerSecondState extends State<lowerSecond> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.11,
        minChildSize: 0.11,
        maxChildSize: 0.4,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Image(image: AssetImage("images/4.jpg")),
          );
        });
  }
}

class upperSecond extends StatefulWidget {
  const upperSecond({Key? key}) : super(key: key);

  @override
  State<upperSecond> createState() => _upperSecondState();
}

class _upperSecondState extends State<upperSecond> {
  var comp = false;
  late final cameras;
  late final firstCamera;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  String? qr;

  _decode(imgpath) async {
    String? a = await Scan.parse(imgpath);
    if (a != Null) {
      qr = a;
    }
  }

  _do() async {
    cameras = await availableCameras();
    firstCamera = cameras.first;
    _controller = CameraController(firstCamera, ResolutionPreset.high);
    _initializeControllerFuture = _controller.initialize();

    print("camera conn");
    setState(() {
      comp = true;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _do();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var a = MediaQuery.of(context).size.width;
    String? b = "hello not";
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: (comp == false)
              ? Text("hello")
              : FutureBuilder<void>(
                  future: _initializeControllerFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      return CameraPreview(_controller);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
        ),
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.black.withOpacity(0.5),
        ),
        Positioned(
          top: 100,
          left: a / 10,
          height: a * 8 / 10,
          width: a * 8 / 10,
          child: Container(
            child: Container(
              child: GestureDetector(
                child: Container(
                  color: Colors.transparent,
                ),
                onTap: () async {
                  final image = await _controller.takePicture();
                  _decode(image.path);
                  if (qr != null) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                Third(qr: (qr!.isNotEmpty) ? qr! : '')));
                  }
                },
              ),
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Colors.white.withOpacity(0.1)),
            ),
            decoration: ShapeDecoration(
              shape: CustomRoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50)),
                topLeftCornerSide: BorderSide(color: Colors.red, width: 8),
                topRightCornerSide: BorderSide(color: Colors.yellow, width: 8),
                bottomLeftCornerSide: BorderSide(color: Colors.blue, width: 8),
                bottomRightCornerSide:
                    BorderSide(color: Colors.green, width: 8),
              ),
            ),
          ),
        ),
        Positioned(
          top: 70 + a,
          left: 95,
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              padding: EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: Row(
                children: [
                  Icon(Icons.collections),
                  Text("   Upload from gallery")
                ],
              ),
            ),
          ),
        ),
        Container(
          child: Text("$b"),
        ),
      ],
    );
  }
}

class Disp extends StatefulWidget {
  const Disp({Key? key, required this.imgpath}) : super(key: key);
  final String imgpath;

  @override
  State<Disp> createState() => _DispState();
}

class _DispState extends State<Disp> {
  String? qr;

  _docode() async {
    String? a = await Scan.parse(widget.imgpath);
    if (a != Null) {
      setState(() {
        qr = a;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _docode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("result")),
      body: Column(
        children: [Image.file(File(widget.imgpath)), Text("asssssssssss:$qr")],
      ),
      //body: Image.file(File(widget.imgpath)),
    );
  }
}
