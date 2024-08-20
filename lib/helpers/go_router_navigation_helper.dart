import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:flutter_starter_template/screens/authentication/phone_verification_screen.dart';
import 'package:flutter_starter_template/screens/authentication/set_new_password.dart';
import 'package:flutter_starter_template/screens/authentication/signup_screen.dart';
import 'package:flutter_starter_template/screens/authentication/welcome_screen.dart';
import 'package:flutter_starter_template/screens/common/error_screen.dart';
import 'package:flutter_starter_template/screens/home_screen.dart';
import 'package:flutter_starter_template/screens/onboarding/car_onboarding_screen.dart';
import 'package:flutter_starter_template/screens/onboarding/location_onboarding_screen.dart';
import 'package:flutter_starter_template/screens/onboarding/time_onboarding_screen.dart';
import 'package:flutter_starter_template/widgets/auth_checker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

final _key = GlobalKey<NavigatorState>();
final routerProvider = Provider<GoRouter>(
  (ref) {
    // final authState = ref.watch(firebaseinitializerProvider);

    return GoRouter(
      navigatorKey: _key,
      initialLocation: '/',
      debugLogDiagnostics: true,
      routes: [
        GoRoute(
          name: 'onboardingLocationScreen',
          path: LocationOnboardingScreen.routeName,
          builder: (context, state) => const LocationOnboardingScreen(),
        ),
        GoRoute(
          name: 'onboardingtimeScreen',
          path: TimeOnboardingScreen.routeName,
          builder: (context, state) => const TimeOnboardingScreen(),
        ),
        GoRoute(
          name: 'onboardingCarScreen',
          path: CarOnboardingScreen.routeName,
          builder: (context, state) => const CarOnboardingScreen(),
        ),
        GoRoute(
          name: 'login',
          path: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: 'home',
          path: HomeScreen.routeName,
          builder: (context, state) => const HomeScreen(),
        ),
        GoRoute(
          name: 'signup',
          path: SignupScreen.routeName,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          name: 'authchecker',
          path: AuthChecker.routeName,
          builder: (context, state) => const AuthChecker(),
        ),
        GoRoute(
          name: 'loginScreen',
          path: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: 'welcomeScreen',
          path: WelcomeScreen.routeName,
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          name: 'phoneVerificationScreen',
          path: PhoneVerificationScreen.routeName,
          builder: (context, state) => const PhoneVerificationScreen(),
        ),
        GoRoute(
          name: 'setNewPasswordScreen',
          path: SetNewPassword.routeName,
          builder: (context, state) => const SetNewPassword(),
        )
      ],
      errorBuilder: (context, state) => const ErrorScreen(),
      // redirect: (context, state) {
      //   authState.when(
      //     data: (data) {
      //       return const AuthChecker();
      //     },
      //     error: (error, stackTrace) => const ErrorScreen(),
      //     loading: () => const CircularProgressIndicator(),
      //   );
      //   return null;
      // },
    );
  },
);
