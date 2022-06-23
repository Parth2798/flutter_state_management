import 'package:flutter/material.dart';
import 'package:flutter_state_management/app/data/controller/resource.dart';
import 'package:flutter_state_management/app/modules/base_get_widget.dart';
import 'package:flutter_state_management/app/modules/home/homeData/model/user_model.dart';
import 'package:flutter_state_management/app/utils/utils.dart';
import 'package:get/get.dart';

import '../controllers/custom_state_controller.dart';

class CustomStateView extends BaseGetWidget<CustomStateController> {
  @override
  String appBarTitle() => "Custom State";

  @override
  Widget body(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Text("data"),
        Obx(() => controller.userModel.value.status == Status.LOADING
            ? showProgress(context)
            : controller.userModel.value.status == Status.SUCCESS
                ? getUsers()
                : controller.userModel.value.status == Status.ERROR
                    ? SnackBarView(
                        title: controller.userModel.value.message ?? "",
                      )
                    : Container())
      ]),
    );
  }

  Widget getUsers() {
    hideProgress();
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
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                    child: CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Padding(
                        padding: const EdgeInsets.all(1),
                        child: ClipOval(
                          child: Image.network(
                            user.avatar ?? "",
                            fit: BoxFit.fill,
                          ),
                        ),
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
