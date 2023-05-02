import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  final List<CameraDescription> theCamera;
  const HomePage({super.key, required this.theCamera});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    //theCameras[0] = front cam
    //theCameras[1] = self cam
    controller = CameraController(widget.theCamera[1], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            // Handle access errors here.
            break;
          default:
            // Handle other errors here.
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Container();
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 40.0,
                left: 20.0,
                right: 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Icon(
                      Icons.menu,
                      color: Colors.black,
                    ),
                    //circle_camera --start
                    Container(
                      height: 60.0,
                      width: 60.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.black,
                          width: 1.0,
                        ),
                        shape: BoxShape.circle,
                      ),
                      alignment: Alignment.center,
                      child: ClipOval(
                        child: OverflowBox(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: ImageFiltered(
                              imageFilter:
                                  ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.grey.withOpacity(0.6),
                                  BlendMode.color,
                                ),
                                child: SizedBox(
                                  height: 50.0,
                                  width: 50.0,
                                  child: CameraPreview(controller),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    //circle_camera --end
                  ],
                ),
              ),
              const Positioned(
                top: 160.0,
                left: 20.0,
                right: 10.0,
                child: Text(
                  "Get the best deals on your\ndream home today",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              ),
              Positioned(
                top: 160.0,
                left: 20.0,
                right: 20.0,
                child: Container(
                  height: 300.0,
                  width: 340.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        blurRadius: 20.0,
                        color: Colors.black12,
                        spreadRadius: 10.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const <Widget>[
                            Text(
                              "Rent",
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                            Text(
                              "Buy",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.0,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 320.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: const <Widget>[
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                "Dubai",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: 50.0,
                          width: 320.0,
                          decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                width: 150.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "Apartement",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                width: 150.0,
                                height: 40.0,
                                decoration: BoxDecoration(
                                  color: Colors.transparent,
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                alignment: Alignment.center,
                                child: const Text(
                                  "House",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 25.0,
                        ),

                        //Rectanle camera --start
                        Stack(
                          children: <Widget>[
                            Container(
                              height: 65.0,
                              width: 320.0,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              alignment: Alignment.center,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: OverflowBox(
                                  alignment: Alignment.center,
                                  child: FittedBox(
                                    fit: BoxFit.fitWidth,
                                    child: ImageFiltered(
                                      imageFilter: ImageFilter.blur(
                                          sigmaX: 3.0, sigmaY: 3.0),
                                      child: ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          Colors.grey.withOpacity(0.6),
                                          BlendMode.color,
                                        ),
                                        child: SizedBox(
                                          height: 65.0,
                                          width: 320.0,
                                          child: CameraPreview(controller),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: 20.0,
                              right: 135.0,
                              child: Text(
                                "Find",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        //Rectanle camera --end
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 300.0,
                right: 10.0,
                left: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const <Widget>[
                      Text(
                        "Popular",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "See All",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 15.0,
                left: 10.0,
                right: 10.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 280.0,
                      width: 190.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                              blurRadius: 10.0,
                              color: Colors.black12,
                              spreadRadius: 10.0),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 4.0,
                          ),
                          SizedBox(
                            width: 180.0,
                            height: 140.0,
                            child: Image.asset(
                              "assets/images/one.jpg",
                              isAntiAlias: true,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            "Modern House",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            r"$ 38000",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              r"Buy",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //second_box
                    Container(
                      height: 280.0,
                      width: 190.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const <BoxShadow>[
                          BoxShadow(
                            blurRadius: 10.0,
                            color: Colors.black12,
                            spreadRadius: 10.0,
                          ),
                        ],
                      ),
                      alignment: Alignment.center,
                      child: Column(
                        children: <Widget>[
                          const SizedBox(
                            height: 4.0,
                          ),
                          SizedBox(
                            width: 180.0,
                            height: 140.0,
                            child: Image.asset(
                              "assets/images/two.jpg",
                              isAntiAlias: true,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          const Text(
                            "Modern House",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          const Text(
                            r"$ 45000",
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              r"Buy",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
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
        ),
      ),
    );
  }
}
