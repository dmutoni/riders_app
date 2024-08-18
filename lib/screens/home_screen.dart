import 'package:flutter/material.dart';
import 'package:flutter_starter_template/repository/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  final bool isLoading = false;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          child: !isLoading
              ? const Text('Logout')
              : const CircularProgressIndicator(),
          onTap: () => {
            ref.read(authenticationProvider.notifier).signOut(),
          },
        ),
      ),
    );
  }
}
