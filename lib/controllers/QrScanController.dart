import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'UserDataController.dart';

class QRScanController extends GetxController {
  var accountNumber = ''.obs;
  QRViewController? qrController;
  final UserController userdetails = Get.find<UserController>();

  void setAccountNumber(String? scannedCode) {
    if (scannedCode != null) {
      accountNumber.value = scannedCode;
      fetchUserDetails(scannedCode);
    }
  }

  void fetchUserDetails(String accountNumber) {
    accountNumber = userdetails.userData['phoneNumber'];
  }

  void onQRViewCreated(QRViewController controller) {
    qrController = controller;
    controller.scannedDataStream.listen((scanData) {
      setAccountNumber(scanData.code);
    });
  }

  @override
  void onClose() {
    qrController?.dispose();
    super.onClose();
  }
}
