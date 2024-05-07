// import 'dart:developer';

// import 'package:converse/src/core/core.dart';
// import 'package:converse/src/features/auth/data/models/login_request.dart';
// import 'package:converse/src/features/auth/data/models/signup_request.dart';
// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';

// abstract class AuthAPi {
//   Future<Either<Failure, AuthResponse>> login(LoginRequest request);

//   Future<Either<Failure, AuthResponse>> signup(SignUpRequest request);
// }

// class AuthAPiImpl extends AuthAPi {
//   AuthAPiImpl(this.client);
//   final ApiClient client;

//   Future<Either<Failure, AuthResponse>> _authenticate(
//       {required Map<String, dynamic> requestJson,
//       required String endpoint}) async {
//     try {
//       final httpResponse = await client.post(endpoint, data: requestJson);

//       final response = AuthResponse.fromJson(httpResponse.data['data']);

//       return right(response);
//     } catch (err, stack) {
//       log(err.toString());
//       log(stack.toString());
//       return left(ApiFailure(message: err.toString()));
//     }
//   }


//   @override
//   Future<Either<Failure, AuthResponse>> login(LoginRequest request) {
//     return _authenticate(
//         requestJson: request.toJson(), endpoint: authEndpoints.login);
//   }

//   @override
//   Future<Either<Failure, AuthResponse>> signup(SignupRequest request) {
//     return _authenticate(
//         requestJson: request.toJson(), endpoint: authEndpoints.signup);
//   }

// }
