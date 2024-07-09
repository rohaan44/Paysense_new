
import 'package:get/get.dart';
import 'package:paysense/utils/util.dart';
import 'package:paysense/viewmodel/enter_acc_no_viewmodel.dart';
import 'package:paysense/views/transact_script_view.dart';
// Make sure this import is correct for your view

class TranscriptController extends GetxController {
  var loading = false.obs;
  final EnterAccController recieverNumber = Get.find<EnterAccController>();

void verifyAccountNumber() async {
  loading.value = true;
  Map<String, dynamic>? userData = await recieverNumber.verifyPhoneNumber();
  loading.value = false;
  if (userData != null) {
    Get.to(() => TransScriptView());
  } else {
    Util.snackBar("Error", "Account Number is invalid");
  }
}

}