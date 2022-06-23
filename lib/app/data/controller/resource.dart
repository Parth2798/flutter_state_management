import 'dart:convert';

import 'package:equatable/equatable.dart';

class Resource<T> extends Equatable {
  Status status;
  T? data;
  String? message;

  Resource(this.status, {this.data, this.message});

  static Resource<T> success<T>(T data) {
    return Resource(Status.SUCCESS, data: data);
  }

  static Resource<T> error<T>({String? msg, T? data}) {
    return Resource(Status.ERROR, data: data, message: msg);
  }

  static Resource<T> loading<T>({String? msg, T? data}) {
    return Resource(Status.LOADING, data: data, message: msg);
  }

  static Resource<T> moreLoading<T>({String? msg, T? data}) {
    return Resource(Status.MORE_LOADING, data: data, message: msg);
  }

  @override
  List<Object?> get props => [status, data, message];

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data != null ? jsonEncode(data) : "DATA",
        "message": message,
      };
}

enum Status {
  SUCCESS, ERROR, LOADING, MORE_LOADING
}
