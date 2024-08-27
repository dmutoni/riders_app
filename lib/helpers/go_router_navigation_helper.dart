import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/data/models/car_model.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/screens/authentication/phone_verification_screen.dart';
import 'package:riders_app/screens/authentication/set_new_password.dart';
import 'package:riders_app/screens/authentication/signup_screen.dart';
import 'package:riders_app/screens/authentication/welcome_screen.dart';
import 'package:riders_app/screens/common/error_screen.dart';
import 'package:riders_app/screens/complains/complain_screen.dart';
import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/screens/onboarding/car_onboarding_screen.dart';
import 'package:riders_app/screens/onboarding/location_onboarding_screen.dart';
import 'package:riders_app/screens/onboarding/time_onboarding_screen.dart';
import 'package:riders_app/screens/transport/available_cars_screen.dart';
import 'package:riders_app/screens/transport/car_details_screen.dart';
import 'package:riders_app/screens/transport/request_for_rent_screen.dart';
import 'package:riders_app/screens/transport/select_transport_screen.dart';
import 'package:riders_app/screens/transport/thank_you_screen.dart';

final _key = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _key,
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: buildRoutes(),
    errorBuilder: (context, state) => const ErrorScreen(),
    // redirect: (context, state) => _redirectLogic(authState),
  );
});

List<GoRoute> buildRoutes() {
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
    GoRoute(
      name: RequestForRentScreen.routeName,
      path: RequestForRentScreen.routeName,
      builder: (context, state) {
        final CarModel? carModel = state.extra as CarModel?;
        return RequestForRentScreen(
          carModel: carModel,
        );
      },
    ),
    GoRoute(
      name: ThankYouScreen.routeName,
      path: ThankYouScreen.routeName,
      builder: (context, state) => const ThankYouScreen(),
    ),
    GoRoute(
      path: ComplainScreen.routeName,
      name: ComplainScreen.routeName,
      builder: (context, state) => const ComplainScreen(),
    ),
  ];
}
