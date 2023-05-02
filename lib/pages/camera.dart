import 'dart:ui';

import 'package:everything_shine/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

/// CameraApp is the Main Application.
class CameraApp extends StatefulWidget {
  final List<CameraDescription> theCameras;

  /// Default Constructor
  const CameraApp({super.key, required this.theCameras});

  @override
  State<CameraApp> createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  late CameraController controller;

  @override
  void initState() {
    super.initState();
    //theCameras[0] = front cam
    //theCameras[1] = self cam
    controller = CameraController(widget.theCameras[1], ResolutionPreset.max);
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
      backgroundColor: Colors.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const Icon(
                Icons.home,
                color: Colors.white,
                size: 150.0,
              ),
              const SizedBox(
                height: 200.0,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Find Your Dream\nHome Today",
                  style: TextStyle(
                    fontSize: 40.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Find Your Dream Home: Rent Or Buy With\nEase On Our Mobile App",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white38,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomePage(
                          theCamera: widget.theCameras,
                        );
                      },
                    ),
                  );
                },
                child: Stack(
                  children: <Widget>[
                    Container(
                      height: 65.0,
                      width: 370.0,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: Colors.white,
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
                              imageFilter:
                                  ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                              child: ColorFiltered(
                                colorFilter: ColorFilter.mode(
                                  Colors.grey.withOpacity(0.6),
                                  BlendMode.color,
                                ),
                                child: SizedBox(
                                  height: 65.0,
                                  width: 370.0,
                                  child: CameraPreview(controller),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 150.0,
                      child: Text(
                        "Lets go",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade600,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
