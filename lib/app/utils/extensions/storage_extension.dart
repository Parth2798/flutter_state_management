import 'package:get_storage/get_storage.dart';

abstract class StorageKey {
  StorageKey._();

  static const USER = "USER";
}

extension ObjectExtension on GetStorage {
  void setUser({String? user = null}) => write(StorageKey.USER, user);

  void getUser() => read(StorageKey.USER);
}
