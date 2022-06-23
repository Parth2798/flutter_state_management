import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:flutter_state_management/app/data/controller/resource.dart';
import 'package:flutter_state_management/app/utils/utils.dart';

class CommonRepository {
  Future<void> callAnyApi<T>(
      Future<HttpResponse<T>> api, Function(Resource<T>) callBack) async {
    callBack(Resource.loading());
    try {
      await api.then((value) {
        if (value.response.statusCode == 200) {
          value.data == null
              ? callBack(Resource.error(msg: value.response.statusMessage))
              : callBack(Resource.success(value.data!));
        } else {
          callBack(Resource.error(msg: value.response.statusMessage));
        }
      }).onError((error, stackTrace) {
        callBack(Resource.error(msg: error.toString()));
        printData("OnError:   error: ${error}   stackTrace: ${stackTrace}");
      });
    } on DioError catch (e) {
      printData(
          "DioError:   error: ${e.message}   stackTrace: ${e.stackTrace}");
      callBack(Resource.error(msg: e.message));
      if (e.response != null) {
        print(e.response!.data ?? "Response data null");
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    } catch (e) {
      printData("catch:   error: ${e}");
      callBack(Resource.error(msg: e.toString()));
    }
  }
}
