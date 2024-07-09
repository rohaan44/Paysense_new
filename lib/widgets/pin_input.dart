import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paysense/viewmodel/trans_confirm_viewmodel.dart';

class OtpInput extends StatelessWidget {
  final bool autoFocus;
  final TextEditingController controller;

  OtpInput(this.controller, this.autoFocus, {Key? key}) : super(key: key);
  final transController = TransConfirmontroller();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 50,
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.none,
        controller: controller, // Use the passed controller
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (kDebugMode) {
            print("Value changed: $value");
          }
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            transController.onTextChanged(value);
          }
        },
      ),
    );
    // Obx(
    //                   () => TextField(
    //                     onChanged: (newText) {
    //                       bePayAmntView.onTextChanged(newText);
    //                     },
    //                     controller: bePayAmntView.textEdit,
    //                     keyboardType: TextInputType.none,
    //                     decoration: InputDecoration(
    //                       border: InputBorder.none,
    //                       hintText: '0',
    //                       hintStyle: TextStyle(
    //                           fontSize: 40, color: ColorUtil.blackcolor),
    //                       // errorText: bePayAmntView.showError.value
    //                       //     ? 'Value must be <= 200000'
    //                       //     : null,
    //                     ),
    //                     style:
    //                         TextStyle(fontSize: bePayAmntView.fontSize.value),
    //                   ),
    //                 ),
  }
}
