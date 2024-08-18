import 'package:flutter/material.dart';
import 'package:flutter_starter_template/repository/auth_repository.dart';
import 'package:flutter_starter_template/screens/common/error_screen.dart';
import 'package:flutter_starter_template/screens/home_screen.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authenticationProvider);
    return authState.when(
      data: (user) {
        if (user != null) {
          return const HomeScreen();
        }

        return const Center(
          child: LoginScreen(),
        );
      },
      loading: () => const Center(
        child: LoginScreen(),
      ),
      error: (error, stackTrace) => const ErrorScreen(),
    );
  }
}
