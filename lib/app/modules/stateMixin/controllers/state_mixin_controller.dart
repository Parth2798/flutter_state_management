import 'package:dio/dio.dart';
import 'package:flutter_state_management/app/modules/home/homeData/model/user_model.dart';
import 'package:get/get.dart';
import 'package:flutter_state_management/app/data/controller/resource.dart';
import 'package:flutter_state_management/app/data/network/common_repository.dart';
import 'package:flutter_state_management/app/modules/home/homeData/repository/request/rest_client.dart';
import 'package:flutter_state_management/app/di/injection_container.dart';

class StateMixinController extends GetxController with StateMixin<Object?> {

  var dio = sl.get<Dio>();
  var restClient;

  var repository = sl.get<CommonRepository>();

  var userModel = Resource<UserModel>(Status.LOADING).obs;
  var user = <User>[].obs;

  @override
  void onInit() {
    super.onInit();
    restClient = RestClient(dio);
    getUserList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void getUserList() {
    repository.callAnyApi<UserModel>(restClient.getUsers(), (it) {
      switch(it.status) {
        case Status.LOADING:
          change(null, status: RxStatus.loading());
          break;
        case Status.SUCCESS:
          if(it.data != null) {
            change(it.data!, status: RxStatus.success());
            user.addAll(it.data!.data ?? []);
          }
          break;
        case Status.ERROR:
          change(it.message!, status: RxStatus.error(it.message ?? ""));
          break;
        case Status.MORE_LOADING:
          break;
      }
    });
  }

}
