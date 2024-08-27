import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riders_app/data/providers/authentication/authentication_provider.dart';
import 'package:riders_app/helpers/go_router_navigation_helper.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/screens/authentication/phone_verification_screen.dart';
import 'package:riders_app/screens/authentication/signup_screen.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';
import 'package:riders_app/widgets/common/input/phone_text_input.dart';

class MockAuthProvider extends Mock implements AuthenticationNotifier {}

void main() {
  group('SignupScreen', () {
    late MockAuthProvider mockAuthProvider;

    setUp(() {
      mockAuthProvider = MockAuthProvider();
    });

    testWidgets('should render all required widgets',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: SignupScreen()),
        ),
      );

      await tester.pumpAndSettle();

      expect(
          find.text('Sign up with your email or phone number'), findsOneWidget);

      expect(find.byType(AppTextInput), findsNWidgets(2));

      expect(find.byType(PhoneNumberInput), findsOneWidget);

      expect(find.text('Sign up'), findsOneWidget);
    });
    testWidgets('should show validation errors when form is invalid',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: SignupScreen()),
        ),
      );

      await tester.tap(find.text('Sign up'));

      await tester.pumpAndSettle();

      // Check for validation errors
      expect(find.text('Name is required'), findsOneWidget);
      expect(find.text('Email is required'), findsOneWidget);

      // Test invalid email
      await tester.enterText(find.byType(AppTextInput).first, 'John Doe');
      await tester.enterText(find.byType(AppTextInput).at(1), 'invalidEmail');

      await tester.tap(find.text('Sign up'));
      await tester.pumpAndSettle();

      expect(find.text('Email is invalid'), findsOneWidget);
    });

    testWidgets(
      'should navigate to PhoneVerificationScreen on successful signup',
      (WidgetTester tester) async {
        await tester.pumpWidget(
          ProviderScope(
            child: MaterialApp.router(
              routerConfig: GoRouter(
                routes: buildRoutes(),
              ),
            ),
          ),
        );

        // Enter valid data
        await tester.enterText(find.byType(AppTextInput).first, 'John Doe');
        await tester.enterText(
            find.byType(AppTextInput).at(1), 'johndoe@example.com');
        await tester.enterText(find.byType(PhoneNumberInput), '1234567890');
        await tester.tap(find.text('Sign up'));
        await tester.pumpAndSettle();

        expect(find.byType(PhoneVerificationScreen), findsOneWidget);
      },
    );

    testWidgets('should navigate to LoginScreen when tapping "Sign in."',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const SignupScreen(),
            onGenerateRoute: (settings) {
              if (settings.name == LoginScreen.routeName) {
                return MaterialPageRoute(builder: (_) => const LoginScreen());
              }
              return null;
            },
          ),
        ),
      );

      await tester.tap(find.text('Already have an account? Sign in.'));
      await tester.pumpAndSettle();

      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
