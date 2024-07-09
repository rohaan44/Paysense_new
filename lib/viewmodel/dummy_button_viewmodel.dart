import 'package:get/get.dart';

class DummyButtonController extends GetxController {
  RxBool loading = false.obs;

  void toggleLoading() {
    loading.toggle();
  }
}
