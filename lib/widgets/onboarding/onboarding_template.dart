import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/onboarding/onboarding_progress_indicator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingTemplate extends ConsumerWidget {
  final String appBarTitle;
  final String sectionTitle;
  final String sectionDescription;
  final String buttonTitle;
  final VoidCallback onButtonTap;
  final String? imageAssetPath;

  const OnboardingTemplate({
    Key? key,
    required this.appBarTitle,
    required this.sectionTitle,
    required this.sectionDescription,
    required this.buttonTitle,
    required this.onButtonTap,
    this.imageAssetPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              child: Text(
                'Skip',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 1.0,
                      fontSize: 16,
                      color: ThemeColors.grey,
                    ),
              ),
              onTap: () => onButtonTap(),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: Dimens.marginSeventy,
          ),
          if (imageAssetPath != null)
            SvgPicture.asset(
              imageAssetPath!,
            ),
          const SizedBox(
            height: Dimens.marginMiddle,
          ),
          Text(
            sectionTitle,
            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: ThemeColors.grey,
                ),
          ),
          const SizedBox(
            height: Dimens.marginTen,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 70,
            ),
            child: Text(
              sectionDescription,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          TwoColorCircleProgressIndicator(
            progress: Dimens.onboardingThirtyProgress,
            color1: ThemeColors.green,
            color2: ThemeColors.lightGreen,
            size: 86,
            strokeWidth: Dimens.marginFive,
            child: Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                color: ThemeColors.green,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward,
                  color: ThemeColors.white,
                ),
                onPressed: onButtonTap,
                color: ThemeColors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
