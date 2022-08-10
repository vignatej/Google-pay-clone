import 'dart:io';
import 'dart:core';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:g_pay/second.dart';
import 'package:camera/camera.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'g pay',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            upper(),
            sheet2(),
          ],
        ),
      ),
    );
  }
}

class sheet2 extends StatefulWidget {
  const sheet2({Key? key}) : super(key: key);

  @override
  State<sheet2> createState() => _sheet2State();
}

class _sheet2State extends State<sheet2> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
        initialChildSize: 0.7,
        minChildSize: 0.7,
        maxChildSize: 1,
        builder: (BuildContext context, ScrollController scrollController) {
          return ListView(
            controller: scrollController,
            children: [
              Stack(
                children: [
                  Image(image: AssetImage("images/b.jpg")),
                  InkWell(
                    child: Container(
                      width: 100,
                      height: 100,
                    ),
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Second())),
                  )
                ],
              ),
              Image(image: AssetImage("images/c.jpg")),
            ],
          );
        });
  }
}

class upper extends StatefulWidget {
  const upper({Key? key}) : super(key: key);

  @override
  State<upper> createState() => _upperState();
}

class _upperState extends State<upper> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        SizedBox(
            height: 30,
            child: Container(
              color: Color.fromRGBO(251, 227, 153, 1),
            )),
        Image(
          image: AssetImage("images/a.jpg"),
        )
      ]),
    );
  }
}





























//random cam opener

/*
class Myapp2 extends StatelessWidget {
  const Myapp2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dummy(),
    );
  }
}

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  late final cameras;
  late final firstCamera;
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool comp = false;

  _do() async {
    cameras = await availableCameras();
    firstCamera = cameras.first;
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      firstCamera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
    comp = true;
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _do();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("dummy")),
      body: (comp == false)
          ? Center(
              child: CircularProgressIndicator(),
            )
          : FutureBuilder<void>(
              future: _initializeControllerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the Future is complete, display the preview.
                  return CameraPreview(_controller);
                } else {
                  // Otherwise, display a loading indicator.
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.black,
                  ));
                }
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final image = await _controller.takePicture();

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Disp(imgpath: image.path)));
        },
        child: Icon(Icons.ac_unit_outlined),
      ),
    );
  }
}

class Disp extends StatelessWidget {
  const Disp({Key? key, required this.imgpath}) : super(key: key);
  final String imgpath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("result")),
      body: Image.file(File(imgpath)),
    );
  }
}



*/