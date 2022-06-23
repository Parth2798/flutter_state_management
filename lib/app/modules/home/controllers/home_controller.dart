import 'package:dio/dio.dart';
import 'package:flutter_state_management/app/data/controller/resource.dart';
import 'package:flutter_state_management/app/data/network/common_repository.dart';
import 'package:flutter_state_management/app/modules/home/homeData/repository/request/rest_client.dart';
import 'package:flutter_state_management/app/di/injection_container.dart';
import 'package:flutter_state_management/app/modules/home/homeData/model/user_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var dio = sl.get<Dio>();
  var restClient;
  var repository = sl.get<CommonRepository>();

  var userModel = Resource<UserModel>(Status.LOADING).obs;
  var user = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    restClient = RestClient(dio);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getUserList() {
    repository.callAnyApi<UserModel>(restClient.getUsers(), (it) {
      userModel(it);
      user.addAll(it.data?.data ?? []);
    });
  }
}
