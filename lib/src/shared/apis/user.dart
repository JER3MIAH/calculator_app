// import 'package:converse/src/shared/entities/entities.dart';
// import 'package:converse/src/shared/utils/utils.dart';

// class UserAPI {
//   static Future<UserLoginResponseEntity> login({
//     LoginRequestEntity? params,
//   }) async {
//     var response = await HttpUtil().post(
//       'api/login',
//       queryParameters: params?.toJson(),
//     );
//     return UserLoginResponseEntity.fromJson(response);
//   }

//   static Future<UserLoginResponseEntity> getProfile() async {
//     var response = await HttpUtil().post(
//       'api/get_profile',
//     );
//     return UserLoginResponseEntity.fromJson(response);
//   }

//   static Future<BaseResponseEntity> updateProfile({
//     LoginRequestEntity? params,
//   }) async {
//     var response = await HttpUtil().post(
//       'api/update_profile',
//       queryParameters: params?.toJson(),
//     );
//     return BaseResponseEntity.fromJson(response);
//   }
// }
