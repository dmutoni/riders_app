import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/screens/authentication/welcome_screen.dart';
import 'package:riders_app/values/assets/onboarding_assets.dart';
import 'package:riders_app/widgets/onboarding/onboarding_template.dart';

class CarOnboardingScreen extends ConsumerWidget {
  static const String routeName = '/onboarding/carOnboardingScreen';

  const CarOnboardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnboardingTemplate(
      onboardingProgress: 1,
      isLastScreen: true,
      appBarTitle: '',
      sectionTitle: 'Book your car',
      sectionDescription:
          'Sell houses easily with the help of Listenoryx and to make this line big I am writing more.',
      buttonTitle: '',
      onButtonTap: () {
        SecureStorageServiceHelper().setIsOnboarded(isOnboarded: true);

        context.pushNamed(
          WelcomeScreen.routeName,
        );
      },
      imageAssetPath: OnboardingAssets.carOnboardingImage,
    );
  }
}
