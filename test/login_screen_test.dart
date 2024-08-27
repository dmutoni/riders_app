import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/screens/authentication/signup_screen.dart';
import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';

void main() {
  group('login_screen_tests', () {
    testWidgets('should show error message for incorrect login credentials',
        (WidgetTester tester) async {
      // Mock SecureStorage values
      await SecureStorageServiceHelper().setEmail(email: 'johndoe@example.com');
      await SecureStorageServiceHelper().setPassword(password: 'password123');

      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(
            home: LoginScreen(),
          ),
        ),
      );

      await tester.enterText(
          find.byType(AppTextInput).first, 'wrong_email@example.com');
      await tester.enterText(find.byType(AppTextInput).at(1), 'password123');

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      expect(find.text('Wrong email or password'), findsOneWidget);
    });

    testWidgets('should navigate to HomeScreen on successful login',
        (WidgetTester tester) async {
      await SecureStorageServiceHelper().setEmail(email: 'johndoe@example.com');
      await SecureStorageServiceHelper().setPassword(password: 'password123');

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const LoginScreen(),
            onGenerateRoute: (settings) {
              if (settings.name == HomeScreen.routeName) {
                return MaterialPageRoute(builder: (_) => const HomeScreen());
              }
              return null;
            },
          ),
        ),
      );

      await tester.enterText(
          find.byType(AppTextInput).first, 'johndoe@example.com');
      await tester.enterText(find.byType(AppTextInput).at(1), 'password123');

      await tester.tap(find.text('Sign In'));
      await tester.pumpAndSettle();

      expect(find.byType(HomeScreen), findsOneWidget);
    });
  });

  testWidgets('should navigate to SignupScreen on tapping link',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          home: const LoginScreen(),
          onGenerateRoute: (settings) {
            if (settings.name == SignupScreen.routeName) {
              return MaterialPageRoute(builder: (_) => const SignupScreen());
            }
            return null;
          },
        ),
      ),
    );

    await tester.tap(find.text('Sign Up'));
    await tester.pumpAndSettle();

    expect(find.byType(SignupScreen), findsOneWidget);
  });
}
