import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/enums/widget_configurations/app_button_variant.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/screens/authentication/signup_screen.dart';
import 'package:riders_app/values/assets/onboarding_assets.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';

class WelcomeScreen extends ConsumerWidget {
  static const String routeName = '/welcomeScreen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.marginMedium),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(flex: 2),
              SvgPicture.asset(OnboardingAssets.welcomeImage),
              const SizedBox(height: Dimens.marginSmall),
              Text(
                'Welcome',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: Dimens.marginSmall),
              Text(
                'Have a better sharing experience',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const Spacer(flex: 12),
              AppButton(
                title: 'Create an account',
                onTap: () {
                  context.pushNamed(SignupScreen.routeName);
                },
              ),
              const SizedBox(height: Dimens.marginDefault),
              AppButton(
                title: 'Log in',
                variant: AppButtonVariant.light,
                onTap: () {
                  context.pushNamed(
                    LoginScreen.routeName,
                  );
                },
              ),
              const Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
