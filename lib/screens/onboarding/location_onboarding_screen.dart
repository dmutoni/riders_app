import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/assets/onboarding_assets.dart';
import 'package:flutter_starter_template/widgets/onboarding/onboarding_template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LocationOnboardingScreen extends ConsumerWidget {
  const LocationOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingTemplate(
      appBarTitle: 'Skip',
      sectionTitle: 'Anywhere you are',
      sectionDescription:
          'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
      buttonTitle: '',
      onButtonTap: () {},
      imageAssetPath: OnboardingAssets.locationOnboardingImage,
    );
  }
}
