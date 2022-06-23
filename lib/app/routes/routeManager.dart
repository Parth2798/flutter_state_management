import 'package:flutter/material.dart';
import 'package:get/get.dart';

//  Current Screen To Next Screen => send argument use #(Get.to(Home(), arguments: "Pass Data"))
//  Current Screen To Next Screen => print argument use #(Get.arguments)

//  Current Screen To Previous Screen => print argument use #(var data = await Get.to(Home()))
//                                    => #printData(data);
//  Current Screen To Previous Screen => send argument use #(Get.back(result: "Pass Data"))

//  Current Screen To Next Screen => send parameters use #(Get.toNamed("Home?name=PARTH&city=SURAT"))
//  Current Screen To Next Screen => print parameters use #(Get.parameters["name"], Get.parameters["city"])

//  Current Screen To Next Screen => send someValue use #(GetPage(name: "Home/:someValue", page: () => const Splash()))
//                                => Get.toNamed("Home/:1234")
//  Current Screen To Next Screen => print parameters use #(Get.parameters["someValue"])

void getTo(
  dynamic page, {
  bool? opaque,
  Transition? transition,
  Curve? curve,
  Duration? duration,
  int? id,
  String? routeName,
  bool fullscreenDialog = false,
  dynamic arguments,
  Bindings? binding,
  bool preventDuplicates = true,
  bool? popGesture,
  double Function(BuildContext context)? gestureWidth,
}) {
  Get.to(page,
      opaque: opaque,
      transition: transition,
      curve: curve,
      duration: duration,
      id: id,
      routeName: routeName,
      fullscreenDialog: fullscreenDialog,
      arguments: arguments,
      binding: binding,
      preventDuplicates: preventDuplicates,
      popGesture: popGesture,
      gestureWidth: gestureWidth);
}

void getOff(
  Page page, {
  bool opaque = false,
  Transition? transition,
  Curve? curve,
  bool? popGesture,
  int? id,
  String? routeName,
  dynamic arguments,
  Bindings? binding,
  bool fullscreenDialog = false,
  bool preventDuplicates = true,
  Duration? duration,
  double Function(BuildContext context)? gestureWidth,
}) {
  Get.off(page,
      opaque: opaque,
      transition: transition,
      curve: curve,
      duration: duration,
      id: id,
      routeName: routeName,
      fullscreenDialog: fullscreenDialog,
      arguments: arguments,
      binding: binding,
      preventDuplicates: preventDuplicates,
      popGesture: popGesture,
      gestureWidth: gestureWidth);
}

void toNamed(
  String pageName, {
  dynamic arguments,
  int? id,
  bool preventDuplicates = true,
  Map<String, String>? parameters,
}) {
  Get.toNamed(pageName,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters);
}

void offNamed(
  String pageName, {
  dynamic arguments,
  int? id,
  bool preventDuplicates = false,
  Map<String, String>? parameters,
}) {
  Get.offNamed(pageName,
      arguments: arguments,
      id: id,
      preventDuplicates: preventDuplicates,
      parameters: parameters);
}

void offAllNamed(
  String pageName, {
  RoutePredicate? predicate,
  dynamic arguments,
  int? id,
  Map<String, String>? parameters,
}) {
  Get.offAllNamed(pageName,
      predicate: predicate,
      arguments: arguments,
      id: id,
      parameters: parameters);
}

void getBack<T>({
  T? result,
  bool closeOverlays = false,
  bool canPop = true,
  int? id,
}) {
  Get.back(
      result: result, closeOverlays: closeOverlays, canPop: canPop, id: id);
}
