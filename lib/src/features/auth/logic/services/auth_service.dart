// import 'package:converse/src/core/core.dart';
// import 'package:converse/src/features/auth/data/models/login_request.dart';
// import 'package:dartz/dartz.dart';

// typedef _SignupOrLogin = Future<Either<Failure, AuthResponse>> Function();

// abstract class AuthService {
//   Future<Either<Failure, AuthResponse>> login(LoginRequest request);

//   Future<Either<Failure, AuthResponse>> signup(SignupRequest request);
// }

// class AuthServiceImpl extends AuthService {
//   AuthServiceImpl({
//     required this.authApi,
//     required this.tokenRepository,
//   });

//   final AuthAPi authApi;
//   final TokenRepository tokenRepository;

//   Future<Either<Failure, AuthResponse>> _authenticate(
//       _SignupOrLogin signupOrLogin) async {
//     final response = await signupOrLogin();
//     return response.fold((failure) {
//       return left(failure);
//     }, (response) async {
//       final success = await tokenRepository.saveToken(
//           response.token,
//           User(
//               email: response.email,
//               id: response.id,
//               firstName: response.firstName,
//               lastName: response.lastName,
//               phoneNumber: response.phoneNumber,
//               dateOfBirth: response.dateOfBirth,
//               address: response.address,
//               photoUrl: response.photoUrl,
//               userType: response.role,
//               driver: response.driver));
//       if (success) {
//         return right(response);
//       }
//       return left(GenericFailure(message: 'failed to save token'));
//     });
//   }

//   @override
//   Future<Either<Failure, AuthResponse>> login(LoginRequest request) {
//     return _authenticate(() => authApi.login(request));
//   }

//   @override
//   Future<Either<Failure, AuthResponse>> signup(SignupRequest request) {
//     return _authenticate(() => authApi.signup(request));
//   }
// }
