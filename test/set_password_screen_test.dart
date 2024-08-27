import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/screens/authentication/set_new_password.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';

void main() {
  group('setPasswordScreen', () {
    testWidgets('should show error messages for invalid passwords',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: SetNewPassword()),
        ),
      );

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      expect(find.text('Password is required'), findsOneWidget);
      expect(find.text('Confirm password is required'), findsOneWidget);

      // Test mismatched passwords
      await tester.enterText(find.byType(AppTextInput).first, 'password123');
      await tester.enterText(find.byType(AppTextInput).at(1), 'wrongPassword');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      await tester.pumpAndSettle();

      expect(find.text('Passwords do not match'), findsOneWidget);

      // Test weak password
      await tester.enterText(find.byType(AppTextInput).first, '123');
      await tester.enterText(find.byType(AppTextInput).at(1), '123');
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();
      expect(
          find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    testWidgets('should update password and navigate to LoginScreen',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            home: const SetNewPassword(),
            onGenerateRoute: (settings) {
              if (settings.name == LoginScreen.routeName) {
                return MaterialPageRoute(builder: (_) => const LoginScreen());
              }
              return null;
            },
          ),
        ),
      );

      await tester.enterText(find.byType(AppTextInput).first, 'newPassword123');
      await tester.enterText(find.byType(AppTextInput).at(1), 'newPassword123');

      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      expect(await SecureStorageServiceHelper().password,
          equals('newPassword123'));

      expect(find.byType(LoginScreen), findsOneWidget);
    });
  });
}
