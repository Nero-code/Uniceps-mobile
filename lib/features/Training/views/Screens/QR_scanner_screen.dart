import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool captured = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Uniceps")),
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                child: MobileScanner(
                  controller: MobileScannerController(returnImage: true),
                  overlay: Stack(
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          const Color.fromARGB(134, 0, 0, 0),
                          BlendMode.srcOut,
                        ),
                        child: Stack(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.75,
                              decoration: BoxDecoration(
                                backgroundBlendMode: BlendMode.dstOut,
                                color: Colors.black,
                              ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: Container(
                                height: MediaQuery.of(context).size.width * 0.5,
                                width: MediaQuery.of(context).size.width * 0.5,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  scanWindow: Rect.fromCircle(
                      center: Offset(MediaQuery.of(context).size.width * 0.5,
                          MediaQuery.of(context).size.height * 0.75 * 0.5),
                      radius: MediaQuery.of(context).size.width * 0.25),
                  onDetect: (capture) {
                    print(capture.raw.toString());
                    setState(() {
                      captured = true;
                    });
                    Future.delayed(Duration(seconds: 5), () {
                      try {
                        Navigator.of(context).pop();
                      } catch (e) {
                        print(e);
                      }
                    });
                  },
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          if (captured)
            Container(
              color: const Color.fromARGB(155, 0, 0, 0),
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.all(50),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }
}
