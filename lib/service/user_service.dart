import 'package:dio/dio.dart';
import 'package:pinterest_clone/Model/photoModel.dart';
import '../core/api.dart';
import '../core/config/doi_config.dart';
import 'log_service.dart';

class PhotoService {
  static final PhotoService _inheritance = PhotoService._init();
  static PhotoService get inheritance => _inheritance;
  PhotoService._init();

  static Future<List<PhotoModel>?> getUsers() async {
    try {
      Response res = await DioConfig.inheritentce.createRequest().get(
          Urls.getPhoto,
          options: Options(headers: {
            "Content-Type": "application/json",
            "x-api-key": Urls.key
          }));
      Log.i(res.data.toString());
      Log.i(res.statusCode.toString());

      if(res.statusCode == 200) {
        List<PhotoModel> PhotoList = [];
        for(var e in (res.data as List)) {
          PhotoList.add(PhotoModel.fromJson(e));
        }

        return PhotoList;
      } else {
        Log.e('${res.statusMessage} ${res.statusCode}');
      }
    } on DioError catch (e) {
      Log.e(e.toString());
      if(e.response != null) {
        Log.e(e.response!.toString());
      } else {
        rethrow;
      }
    } catch (e) {
      Log.e(e.toString());

    }
    return null;
  }

/*
static Future<bool> deleteUser(String id) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().delete(
      Urls.deleteUsers + id.toString(),
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}

static Future<bool> createUser(UserModel newPost) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().post(
        Urls.getUsers,
        data:  {
          "name" : newPost.name,
          "phone" : newPost.phone,
          "age" : newPost.age,
          "gender" : newPost.gender,
          "passport" : newPost.passport,
          "familyMembers" : newPost.familyMembers,
        }
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}

static Future<bool> editUser(UserModel newPost) async {
  try {
    Response res = await DioConfig.inheritentce.createRequest().put(
        Urls.updateUsers + newPost.id.toString(),
        data:  {
          "name" : newPost.name,
          "phone" : newPost.phone,
          "age" : newPost.age,
          "gender" : newPost.gender,
          "passport" : newPost.passport,
          "familyMembers" : newPost.familyMembers,
        }
    );
    Log.i(res.data.toString());
    Log.i(res.statusCode.toString());

    if(res.statusCode == 200 || res.statusCode == 201) {
      return true;
    } else {
      Log.e('${res.statusMessage} ${res.statusCode}');
      return false;
    }
  } on DioError catch (e) {
    if(e.response != null) {
      Log.e(e.response!.toString());
      return false;
    } else {
      rethrow;
    }
  } catch (e) {
    Log.e(e.toString());
    return false;
  }
  // return null;
}
*/

  // static Future<UserModel?> getUserById(int id) async {
  //   try {
  //     Response res = await DioConfig.inheritentce.createRequest().get(Urls.getSingleUsers + id.toString());
  //     Log.i(res.data.toString());
  //     Log.i(res.statusCode.toString());
  //
  //     if(res.statusCode == 200) {
  //       UserModel user  = UserModel.fromJson(res.data);
  //
  //       return user;
  //     } else {
  //       Log.e('${res.statusMessage} ${res.statusCode}');
  //     }
  //   } on DioError catch (e) {
  //     Log.e(e.toString());
  //     if(e.response != null) {
  //       Log.e(e.response!.toString());
  //     } else {
  //       rethrow;
  //     }
  //   } catch (e) {
  //     Log.e(e.toString());
  //
  //   }
  //   return null;
  // }


  //

  //

}

