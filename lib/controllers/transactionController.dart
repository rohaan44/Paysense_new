import 'package:get/get.dart';
import 'package:paysense/controllers/UserDataController.dart';
import 'package:paysense/viewmodel/bepay_amnt_viemodel.dart';
import 'package:paysense/viewmodel/enter_acc_no_viewmodel.dart';
import 'package:intl/intl.dart';

class TransactionController extends GetxController {
  
  final recieverData = Get.find<EnterAccController>().userData;
   final senderData = Get.find<UserController>().userData;
  final sendingAmountController = Get.find<BePayAmntController>().textEdit;
  
  void transaction(){
    int? receiverAmount = int.tryParse(recieverData['amount'].toString());
     int? senderAmount = int.tryParse(senderData['amount'].toString());
    int? sendingAmount = int.tryParse(sendingAmountController.text);

     if (receiverAmount != null && senderAmount != null && sendingAmount != null){
      if(senderAmount >= sendingAmount){
       int updatedSenderAmount = senderAmount - sendingAmount;
        int updatedReceiverAmount = receiverAmount + sendingAmount;
        
        // Format the amounts
        var formatter = NumberFormat('#,##0.0', 'en_US');
        String formattedUpdatedSenderAmount = formatter.format(updatedSenderAmount);
        String formattedUpdatedReceiverAmount = formatter.format(updatedReceiverAmount);
        

      }
     }
  }
}