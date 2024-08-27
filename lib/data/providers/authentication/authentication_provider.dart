import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/helpers/mail_helper.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';

class AuthenticationState {
  final String? sentOtp;
  final String? enteredOtp;
  final bool? isSendingOtp;
  final String? email;
  final String? password;
  final String? name;
  final String? phoneNumber;
  final String? gender;

  AuthenticationState({
    this.sentOtp,
    this.enteredOtp,
    this.isSendingOtp,
    this.email,
    this.password,
    this.name,
    this.phoneNumber,
    this.gender,
  });

  AuthenticationState copyWith({
    String? sentOtp,
    String? enteredOtp,
    bool? isSendingOtp,
    String? email,
    String? password,
    String? name,
    String? phoneNumber,
    String? gender,
  }) {
    return AuthenticationState(
      sentOtp: sentOtp ?? this.sentOtp,
      enteredOtp: enteredOtp ?? this.enteredOtp,
      isSendingOtp: isSendingOtp ?? this.isSendingOtp,
      email: email ?? this.email,
      password: password ?? this.password,
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
    );
  }
}

class AuthenticationNotifier extends StateNotifier<AuthenticationState> {
  AuthenticationNotifier() : super(AuthenticationState());

  Future<void> copyWith({
    String? sentOtp,
    String? enteredOtp,
    bool? isSendingOtp,
    String? email,
    String? password,
    String? name,
    String? phoneNumber,
    String? gender,
  }) async {
    state = state.copyWith(
      sentOtp: sentOtp,
      enteredOtp: enteredOtp,
      isSendingOtp: isSendingOtp,
      email: email,
      password: password,
      name: name,
      phoneNumber: phoneNumber,
      gender: gender,
    );
  }

  void setOtp(String otp) {
    state = state.copyWith(sentOtp: otp);
  }

  bool verifyOtp() {
    if (state.sentOtp == state.enteredOtp) {
      return true;
    }
    return false;
  }

  String generateOtp() {
    var rng = Random();
    return (rng.nextInt(9000) + 1000).toString();
  }

  Future<void> sendOtpToUser(String email) async {
    String otp = generateOtp();

    state = state.copyWith(isSendingOtp: false);

    try {
      state = state.copyWith(isSendingOtp: true);

      await sendOtpEmail(recipientEmail: email, otp: otp);

      state = state.copyWith(sentOtp: otp, isSendingOtp: false);
      return;
    } catch (e) {
      throw Exception('Failed to send OTP');
    }
  }

  Future<void> saveUserDetails() async {
    await SecureStorageServiceHelper().saveUserDetails(
      name: state.name ?? '',
      phoneNumber: state.phoneNumber ?? '',
      email: state.email ?? '',
      gender: state.gender ?? '',
    );
  }
}

final authentionProvider =
    StateNotifierProvider<AuthenticationNotifier, AuthenticationState>(
  (ref) => AuthenticationNotifier(),
);
