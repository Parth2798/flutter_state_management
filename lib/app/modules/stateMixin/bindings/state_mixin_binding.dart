import 'package:get/get.dart';

import '../controllers/state_mixin_controller.dart';

class StateMixinBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StateMixinController>(
      () => StateMixinController(),
    );
  }
}
