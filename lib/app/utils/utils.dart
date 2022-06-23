import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void printData(Object msg, {Object title = "printData"}) {
  if (kDebugMode) {
    print("$printData: $msg");
  }
}

class SnackBarView extends StatefulWidget {
  const SnackBarView({Key? key, this.title = "", this.message = "", this.bgColor = Colors.black87})
      : super(key: key);

  final String title;
  final String message;
  final Color bgColor;

  @override
  State<SnackBarView> createState() => _SnackBarViewState();
}

class _SnackBarViewState extends State<SnackBarView> {
  @override
  Widget build(BuildContext context) {
    showSnackBar(title: widget.title, message: widget.message, bgColor: widget.bgColor);
    return Container();
  }
}

void showSnackBar(
    {String title = "", String message = "", Color bgColor = Colors.black87}) {
  Get.snackbar(title, message,
      colorText: Colors.white,
      backgroundColor: bgColor,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM);
}
