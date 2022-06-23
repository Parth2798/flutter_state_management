import 'package:flutter/material.dart';
import 'package:flutter_state_management/app/custom/view/Loader.dart';
import 'package:flutter_state_management/app/routes/routeManager.dart';
import 'package:flutter_state_management/app/utils/resolution.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

abstract class BaseGetWidget<T> extends GetView<T> {
  final storage = GetStorage();

  String appBarTitle() => "";

  bool isBackButton() => true;

  bool isAppBar() => true;

  void onClickBackButton() {
    getBack();
  }

  double wdp(double dp) => SDP.wdp(dp);

  double hdp(double dp) => SDP.hdp(dp);

  @override
  Widget build(BuildContext context) {
    SDP.init(context);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            appBar: isAppBar() == true
                ? AppBar(
                    elevation: 1,
                    flexibleSpace: Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                        Colors.blue,
                        Colors.blue,
                        Colors.blueAccent
                      ])),
                    ),
                    title: Text(
                      appBarTitle(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    leading: isBackButton()
                        ? IconButton(
                            icon: const Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              onClickBackButton();
                            },
                          )
                        : Container(),
                  )
                : null,
            body: Container(
              child: body(context),
            )),
      ),
    );
  }

  Widget body(BuildContext context);

  Widget showProgress(context) {
    Loader.show(context);
    return Container();
  }

  void hideProgress() {
    Loader.hide();
  }
}
