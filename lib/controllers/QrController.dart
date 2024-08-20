import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter/services.dart';

class QRController extends GetxController {
  var qrResult = ''.obs;
  
  Future<void> scanQR() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      if (qrCode != '-1') { // '-1' is the code returned when the scan is canceled
        qrResult.value = qrCode;
      }
    } on PlatformException {
      qrResult.value = 'Failed to read QR Code';
    } catch (error) {
      qrResult.value = 'Failed to read QR Code';
    }
  }
}
