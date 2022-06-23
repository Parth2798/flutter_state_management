import 'package:get/get.dart';

import '../modules/customState/bindings/custom_state_binding.dart';
import '../modules/customState/views/custom_state_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/stateMixin/bindings/state_mixin_binding.dart';
import '../modules/stateMixin/views/state_mixin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOM_STATE,
      page: () => CustomStateView(),
      binding: CustomStateBinding(),
    ),
    GetPage(
      name: _Paths.STATE_MIXIN,
      page: () => StateMixinView(),
      binding: StateMixinBinding(),
    ),
  ];
}
