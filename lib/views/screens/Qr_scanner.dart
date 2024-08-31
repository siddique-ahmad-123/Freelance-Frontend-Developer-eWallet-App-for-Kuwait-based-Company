import 'dart:io';
import 'package:az_e_wallet/views/widgets/custom_button.dart';
import 'package:az_e_wallet/views/widgets/theme.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    final double containerSize = screenWidth * 0.6;
    final double lineLength = screenWidth * 0.1;
    final double lineThickness = 4.0; // Increase the thickness for visibility

    return Stack(
      children: [
        // Background image that covers the whole screen
        Positioned.fill(
          child: Image.asset(
            'assets/images/background_img.png',
            fit: BoxFit.cover,
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              "QR Code",
              style: TextStyle(color: Color(0xFFFFFFFF)),
            ),
            centerTitle: true,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Color(0xFFFFFFFF),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: containerSize,
                        height: containerSize,
                        child: QRView(
                          key: qrKey,
                          onQRViewCreated: _onQRViewCreated,
                          overlay: QrScannerOverlayShape(
                            borderColor:
                                Colors.transparent, // Make overlay transparent
                            borderRadius: 0.0,
                            borderLength: 0.0,
                            borderWidth: 0.0,
                            cutOutSize: containerSize,
                          ),
                        ),
                      ),
                    ),
                    // Adding visible corner lines
                    Positioned(
                      top: -lineThickness / 2,
                      left: -lineThickness / 2,
                      child: Container(
                        width: lineLength,
                        height: lineThickness,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: -lineThickness / 2,
                      right: -lineThickness / 2,
                      child: Container(
                        width: lineLength,
                        height: lineThickness,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: -lineThickness / 2,
                      left: -lineThickness / 2,
                      child: Container(
                        width: lineLength,
                        height: lineThickness,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: -lineThickness / 2,
                      right: -lineThickness / 2,
                      child: Container(
                        width: lineLength,
                        height: lineThickness,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: -lineThickness / 2,
                      left: -lineThickness / 2,
                      child: Container(
                        width: lineThickness,
                        height: lineLength,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      top: -lineThickness / 2,
                      right: -lineThickness / 2,
                      child: Container(
                        width: lineThickness,
                        height: lineLength,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: -lineThickness / 2,
                      left: -lineThickness / 2,
                      child: Container(
                        width: lineThickness,
                        height: lineLength,
                        color: Colors.white,
                      ),
                    ),
                    Positioned(
                      bottom: -lineThickness / 2,
                      right: -lineThickness / 2,
                      child: Container(
                        width: lineThickness,
                        height: lineLength,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.1),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 26.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        text: 'Download',
                        icon: Icons.copy_all,
                        onPressed: _downloadQRCode,
                        backgroundColor: AppTheme.primaryColor,
                        textColor: AppTheme.buttonTextColor,
                      ),
                      CustomButton(
                        text: 'Share QR',
                        icon: Icons.share,
                        onPressed: _shareQRCode,
                        backgroundColor: Color(0xFFDADADA),
                        textColor: Color(0xFF222766),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      print(scanData.code);
    });
  }

  void _downloadQRCode() {
    print('Download QR Code');
  }

  void _shareQRCode() {
    print('Share QR Code');
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
