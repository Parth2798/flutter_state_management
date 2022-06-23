import 'package:flutter/material.dart';
import 'package:flutter_state_management/app/routes/routeManager.dart';
import 'package:flutter_state_management/app/utils/resolution.dart';
import 'package:get_storage/get_storage.dart';

abstract class BaseWidget extends StatefulWidget {
  const BaseWidget({Key? key}) : super(key: key);
}

abstract class BaseWidgetState<Page extends BaseWidget> extends State<Page> {

  final storage = GetStorage();

  String appBarTitle() => "";

  bool isBackButton() => true;

  bool isAppBar() => false;

  void onClickBackButton() {
    getBack();
  }

  double wdp(double dp) => SDP.wdp(dp);

  double hdp(double dp) => SDP.hdp(dp);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SDP.init(context);

    return Container(
      color: Colors.white,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: isAppBar() == true
              ? AppBar(
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Colors.white])),
                  ),
                  title: Text(
                    appBarTitle(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  leading: isBackButton()
                      ? IconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.black,
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
    );
  }

  Widget body(BuildContext context);
}
