import 'package:flutter/material.dart';
import 'package:flutter_state_management/app/custom/view/material_button.dart';
import 'package:flutter_state_management/app/modules/base_get_widget.dart';
import 'package:flutter_state_management/app/routes/app_pages.dart';
import 'package:flutter_state_management/app/routes/routeManager.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends BaseGetWidget<HomeController> {
  @override
  bool isBackButton() => false;

  @override
  String appBarTitle() => "Home";

  @override
  Widget body(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getMaterialButton(
            onPressed: () {
              toNamed(Routes.STATE_MIXIN);
            },
            text: "State Mixin",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            color: Colors.blue
          ),
          getMaterialButton(
            onPressed: () {
              toNamed(Routes.CUSTOM_STATE);
            },
            text: "Custom State",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            color: Colors.blue
          ),
        ],
      ),
    );
  }
}
