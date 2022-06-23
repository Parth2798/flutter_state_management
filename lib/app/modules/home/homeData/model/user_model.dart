import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? data;
  Support? support;

  UserModel(
      {this.page,
      this.perPage,
      this.total,
      this.totalPages,
      this.data,
      this.support});

  factory UserModel.fromJson(Map<String, dynamic> json)  => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['page'] = page;
    map['per_page'] = perPage;
    map['total'] = total;
    map['total_pages'] = totalPages;
    map['data'] = data?.map((v) => v.toJson()).toList() ?? null;
    if (support != null) {
      map['support'] = support!.toJson();
    }
    return map;
  }
}

@JsonSerializable()
class User {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  User({this.id, this.email, this.first_name, this.last_name, this.avatar});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = first_name;
    data['last_name'] = last_name;
    data['avatar'] = avatar;
    return data;
  }
}

@JsonSerializable()
class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
