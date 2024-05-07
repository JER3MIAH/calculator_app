import 'package:converse/src/features/auth/logic/services/auth_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authService = AuthService();

final authServiceProvider = Provider<AuthService>((ref) => authService);
