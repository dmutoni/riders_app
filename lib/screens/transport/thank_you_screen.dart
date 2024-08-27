import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/screens/complains/complain_screen.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';

class ThankYouScreen extends ConsumerWidget {
  static const String routeName = '/thank-you';
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(
            Dimens.marginDefault,
          ),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Row(
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  size: 15,
                ),
                Text(
                  'Back',
                ),
              ],
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.all(
            Dimens.marginDefault,
          ),
          child: Column(
            children: [
              const Icon(
                Icons.check_circle,
                size: 100,
                color: Colors.green,
              ),
              const SizedBox(height: 16.0),
              const Text(
                'Thank you for your request!, Please give us feedback',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 400),
              AppButton(
                title: 'Give us feedback',
                onTap: () => {
                  context.pushNamed(
                    ComplainScreen.routeName,
                  ),
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
