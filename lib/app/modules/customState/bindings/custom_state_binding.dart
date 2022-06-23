import 'package:get/get.dart';

import '../controllers/custom_state_controller.dart';

class CustomStateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomStateController>(
      () => CustomStateController(),
    );
  }
}
