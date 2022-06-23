import 'package:get/get.dart';

extension DynamicTypeExtension on dynamic {
  bool get isNullOrEmpty => GetUtils.isNullOrBlank(this) == null
      ? false
      : GetUtils.isNullOrBlank(this)!;
}

extension ListExtension on List {
  bool get isNullOrEmpty => GetUtils.isNullOrBlank(this) == null
      ? false
      : GetUtils.isNullOrBlank(this)!;
}
