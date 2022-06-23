// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(
    page: json['page'] as int?,
    perPage: json['perPage'] as int?,
    total: json['total'] as int?,
    totalPages: json['totalPages'] as int?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => User.fromJson(e as Map<String, dynamic>))
        .toList(),
    support: json['support'] == null
        ? null
        : Support.fromJson(json['support'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'total': instance.total,
      'totalPages': instance.totalPages,
      'data': instance.data,
      'support': instance.support,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int?,
    email: json['email'] as String?,
    first_name: json['first_name'] as String?,
    last_name: json['last_name'] as String?,
    avatar: json['avatar'] as String?,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };

Support _$SupportFromJson(Map<String, dynamic> json) {
  return Support(
    url: json['url'] as String?,
    text: json['text'] as String?,
  );
}

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
