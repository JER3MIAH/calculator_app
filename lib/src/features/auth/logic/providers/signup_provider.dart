import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signUpProvider = ChangeNotifierProvider((ref) {
  return SingupProvider();
});

class SingupProvider extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String fullName = '';
  String number = '';
  String email = '';
  String password = '';
  String errorMessage = '';

  bool _buttonEnabled = false;
  bool get buttonEnabled => _buttonEnabled;
  set buttonEnabled(bool value) {
    _buttonEnabled = value;
    notifyListeners();
  }

  void onInputChanged({
    required String firstName,
    required String email,
    required String phoneNumber,
    required String password,
  }) {
    if (firstName.isNotEmpty &&
        email.isNotEmpty &&
        phoneNumber.isNotEmpty &&
        password.isNotEmpty) {
      buttonEnabled = true;
    } else {
      buttonEnabled = false;
    }
  }

  void disposeValues() {
    fullName = '';
    number = '';
    email = '';
    password = '';
    errorMessage = '';
  }
}
