import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/screens/onboarding/car_onboarding_screen.dart';
import 'package:riders_app/values/assets/onboarding_assets.dart';
import 'package:riders_app/widgets/onboarding/onboarding_template.dart';

class TimeOnboardingScreen extends ConsumerWidget {
  static const String routeName = '/onboarding/timeOnboardingScreen';

  const TimeOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingTemplate(
      onboardingProgress: 0.7,
      appBarTitle: 'Skip',
      sectionTitle: 'At anytime',
      sectionDescription:
          'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
      buttonTitle: '',
      onButtonTap: () {
        context.pushNamed(
          CarOnboardingScreen.routeName,
        );
      },
      imageAssetPath: OnboardingAssets.timeOnboardingImage,
    );
  }
}
