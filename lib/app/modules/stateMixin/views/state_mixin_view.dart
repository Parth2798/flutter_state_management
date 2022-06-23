import 'package:flutter/material.dart';
import 'package:flutter_state_management/app/modules/base_get_widget.dart';
import 'package:flutter_state_management/app/modules/home/homeData/model/user_model.dart';
import 'package:flutter_state_management/app/utils/utils.dart';
import 'package:get/get.dart';

import '../controllers/state_mixin_controller.dart';

class StateMixinView extends BaseGetWidget<StateMixinController> {
  @override
  String appBarTitle() => "State Mixin";

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Text("data"),
        controller.obx((data) => getUsers(),
            onError: (msg) => SnackBarView(title: msg!))
      ]),
    );
  }

  Widget getUsers() {

    return ListView.builder(
        physics: ScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: controller.user.length,
        itemBuilder: (context, index) {
          return getUserListView(controller.user[index]);
        });
  }

  Widget getUserListView(User? user) {
    return user == null
        ? Container()
        : Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 150,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        user.avatar ?? "",
                        width: 150,
                        height: 100,
                        fit: BoxFit.scaleDown,
                        color: Colors.purple,
                        colorBlendMode: BlendMode.color,
                      ),
                    ),
                  ),
                  Flexible(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (user.first_name ?? "") + " " + (user.last_name ?? ""),
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        user.email ?? "",
                        style: TextStyle(fontSize: 18, color: Colors.grey),
                      ),
                    ],
                  ))
                ],
              ),
              Container(
                color: Colors.grey[200],
                height: 2,
              )
            ],
          );
  }
}
