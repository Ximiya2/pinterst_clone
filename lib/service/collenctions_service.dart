import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:pinterest_clone/Model/MuteAndPastelModel.dart';
import 'package:pinterest_clone/Model/Yellow RushModel.dart';
import 'package:pinterest_clone/view/HomePage/Yellow%20Rush_page/YellowRush_Page.dart';
import '../Model/MockUpsModel.dart';
import '../Model/TisTheSeasonModel.dart';
import '../Model/photoModel.dart';
import '../core/dio/api.dart';
import '../core/dio/dio_error_exception.dart';
import 'utils/log_service.dart';

class CollectionsService{

  static Future<Either<String,List<PhotoModel>>> YellowRushPhotos({int? page}) async{
    try{
      Response response = await Dio().get(
          '${Endpoints.CollentionPhotos}3326482/photos?page=$page&per_page=30&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<PhotoModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(PhotoModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<TisTheSeasonModel>>> TisTheSeasonPhotos({int? page}) async{
    try{
      Response response = await Dio().get(
          '${Endpoints.CollentionPhotos}365154/photos?page=$page&per_page=30&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<TisTheSeasonModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(TisTheSeasonModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<MuteAndPastelModel>>> MuteAndPastelPhotos({int? page}) async{
    try{
      Response response = await Dio().get(
          '${Endpoints.CollentionPhotos}8240068/photos?page=$page&per_page=30&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<MuteAndPastelModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(MuteAndPastelModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

  static Future<Either<String,List<MockUpsModel>>> MockUpsPhotos({int? page}) async{
    try{
      Response response = await Dio().get(
          '${Endpoints.CollentionPhotos}4474589/photos?page=$page&per_page=30&order_by=ASC',
          options: Options(headers: {
            'x-api-key': Endpoints.apiKey,
            'Authorization': 'Bearer ${Endpoints.token}'
          })
      );
      Log.w(response.statusCode.toString());
      if(response.statusCode == 200 || response.statusCode == 201){
        List<MockUpsModel> photos = [];
        for (var e in (response.data as List)) {
          photos.add(MockUpsModel.fromJson(e));
        }
        return right(photos);
      }else{
        Log.e( DioExceptions.fromDioError(response.data).toString());
        return left(DioExceptions.fromDioError(response.data).toString());
      }
    } on DioError catch (e) {
      Log.e( e.toString());
      if(DioExceptions.fromDioError(e).toString() == 'Unauthorized'){
        return left('Token xatoo');
      }
      return left(DioExceptions.fromDioError(e).toString());
    } catch (m) {
      Log.e( m.toString());
      return left(m.toString());
    }
  }

}

