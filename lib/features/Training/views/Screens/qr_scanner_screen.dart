import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

@Deprecated("QR Scan from mobile is disabled in this version 1.0.0")
class QRScannerScreen extends StatefulWidget {
  const QRScannerScreen({super.key});

  @override
  State<QRScannerScreen> createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  bool captured = false;

  bool codeOrScan = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Uniceps")),
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.75,
                child: codeOrScan
                    ? MobileScanner(
                        controller: MobileScannerController(returnImage: true),
                        overlayBuilder: (context, constraints) => Stack(
                          children: [
                            ColorFiltered(
                              colorFilter: const ColorFilter.mode(
                                Color.fromARGB(134, 0, 0, 0),
                                BlendMode.srcOut,
                              ),
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.75,
                                    decoration: BoxDecoration(
                                      backgroundBlendMode: BlendMode.dstOut,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.5,
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
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
                            center: Offset(
                                MediaQuery.of(context).size.width * 0.5,
                                MediaQuery.of(context).size.height *
                                    0.75 *
                                    0.5),
                            radius: MediaQuery.of(context).size.width * 0.25),
                        onDetect: (capture) {
                          print(capture.raw);
                          setState(() {
                            captured = true;
                          });
                          Future.delayed(Duration(seconds: 5), () {
                            try {
                              // Navigator.of(context).pop();
                            } catch (e) {
                              print(e);
                            }
                          });
                        },
                      )
                    : Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: MediaQuery.of(context).size.width * 0.5,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: QrImageView(
                            data:
                                'This is a really long text and i want to express how i feel through QR code and i feel amazing to work with flutter because its easy thank and goodbye!!!',
                            eyeStyle: QrEyeStyle(
                              eyeShape: QrEyeShape.square,
                              color: Colors.blue,
                            ),
                            embeddedImage: AssetImage('images/logo/Logo.png'),
                            embeddedImageStyle:
                                QrEmbeddedImageStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("CodeNum: 123456789"),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            codeOrScan = !codeOrScan;
                          });
                        },
                        child: Icon(Icons.change_circle),
                      ),
                    ],
                  ),
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
