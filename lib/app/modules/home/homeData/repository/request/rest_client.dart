import 'package:dio/dio.dart';
import 'package:flutter_state_management/app/modules/home/homeData/model/user_model.dart';
import 'package:retrofit/retrofit.dart';
part 'rest_client.g.dart';

@RestApi(baseUrl: "https://reqres.in/api/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("users?page=1")
  Future<HttpResponse<UserModel>> getUsers();
}
