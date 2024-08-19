import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/screens/authentication/signup_screen.dart';
import 'package:flutter_starter_template/values/assets/onboarding_assets.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class WelcomeScreen extends ConsumerWidget {
  static const String routeName = '/welcomeScreen';
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(
            Dimens.marginMedium,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              SvgPicture.asset(
                OnboardingAssets.welcomeImage,
              ),
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Have a better sharing experience',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(
                height: 230,
              ),
              AppButton(
                title: 'Create an account',
                onTap: () {
                  context.go(SignupScreen.routeName);
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AppButton(
                title: 'Log in',
                variant: AppButtonVariant.light,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
