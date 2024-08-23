import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/data/models/car_model.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:flutter_starter_template/screens/authentication/phone_verification_screen.dart';
import 'package:flutter_starter_template/screens/authentication/set_new_password.dart';
import 'package:flutter_starter_template/screens/authentication/signup_screen.dart';
import 'package:flutter_starter_template/screens/authentication/welcome_screen.dart';
import 'package:flutter_starter_template/screens/common/error_screen.dart';
import 'package:flutter_starter_template/screens/home/home_screen.dart';
import 'package:flutter_starter_template/screens/onboarding/car_onboarding_screen.dart';
import 'package:flutter_starter_template/screens/onboarding/location_onboarding_screen.dart';
import 'package:flutter_starter_template/screens/onboarding/time_onboarding_screen.dart';
import 'package:flutter_starter_template/screens/transport/available_cars_screen.dart';
import 'package:flutter_starter_template/screens/transport/car_details_screen.dart';
import 'package:flutter_starter_template/screens/transport/select_transport_screen.dart';
import 'package:flutter_starter_template/widgets/auth_checker.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseinitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  // final authState = ref.watch(firebaseinitializerProvider);

  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: _buildRoutes(),
    errorBuilder: (context, state) => const ErrorScreen(),
    // redirect: (context, state) => _redirectLogic(authState),
  );
});

List<GoRoute> _buildRoutes() {
  return [
    GoRoute(
      name: LocationOnboardingScreen.routeName,
      path: LocationOnboardingScreen.routeName,
      builder: (context, state) => const LocationOnboardingScreen(),
    ),
    GoRoute(
      name: TimeOnboardingScreen.routeName,
      path: TimeOnboardingScreen.routeName,
      builder: (context, state) => const TimeOnboardingScreen(),
    ),
    GoRoute(
      name: CarOnboardingScreen.routeName,
      path: CarOnboardingScreen.routeName,
      builder: (context, state) => const CarOnboardingScreen(),
    ),
    GoRoute(
      name: LoginScreen.routeName,
      path: LoginScreen.routeName,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      name: HomeScreen.routeName,
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      name: SignupScreen.routeName,
      path: SignupScreen.routeName,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      name: AuthChecker.routeName,
      path: AuthChecker.routeName,
      builder: (context, state) => const AuthChecker(),
    ),
    GoRoute(
      name: WelcomeScreen.routeName,
      path: WelcomeScreen.routeName,
      builder: (context, state) => const WelcomeScreen(),
    ),
    GoRoute(
      name: PhoneVerificationScreen.routeName,
      path: PhoneVerificationScreen.routeName,
      builder: (context, state) => const PhoneVerificationScreen(),
    ),
    GoRoute(
      name: SetNewPassword.routeName,
      path: SetNewPassword.routeName,
      builder: (context, state) => const SetNewPassword(),
    ),
    GoRoute(
      name: SelectTransportScreen.routeName,
      path: SelectTransportScreen.routeName,
      builder: (context, state) => const SelectTransportScreen(),
    ),
    GoRoute(
      name: AvailableCarsScreen.routeName,
      path: AvailableCarsScreen.routeName,
      builder: (context, state) => const AvailableCarsScreen(),
    ),
    GoRoute(
      name: CarDetailsScreen.routeName,
      path: CarDetailsScreen.routeName,
      builder: (context, state) {
        final CarModel? carModel = state.extra as CarModel?;
        return CarDetailsScreen(
          carModel: carModel,
        );
      },
    ),
  ];
}

// String? _redirectLogic(AsyncValue<FirebaseApp> authState) {
//   return authState.when(
//     data: (data) {
//       // Add your redirect logic here based on authentication state
//       // Example: if the user is not authenticated, redirect to the login screen
//       return null;  // return path to redirect, or null if no redirect
//     },
//     error: (error, stackTrace) => ErrorScreen.routeName,
//     loading: () => null,  // Show a loading indicator if necessary
//   );
// }
