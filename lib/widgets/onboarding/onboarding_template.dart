import 'package:flutter/material.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/onboarding/onboarding_progress_indicator.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingTemplate extends ConsumerWidget {
  final String? appBarTitle;
  final String? sectionTitle;
  final String? sectionDescription;
  final String? buttonTitle;
  final VoidCallback onButtonTap;
  final String? imageAssetPath;
  final bool? isLastScreen;
  final double? onboardingProgress;

  const OnboardingTemplate({
    Key? key,
    this.appBarTitle,
    this.sectionTitle,
    this.sectionDescription,
    this.buttonTitle,
    required this.onButtonTap,
    this.imageAssetPath,
    this.isLastScreen,
    this.onboardingProgress,
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
                appBarTitle ?? '',
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
            sectionTitle ?? '',
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
              sectionDescription ?? '',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          TwoColorCircleProgressIndicator(
            progress: onboardingProgress ?? 0.0,
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
              child: (isLastScreen ?? false)
                  ? GestureDetector(
                      onTap: onButtonTap,
                      child: Center(
                        child: Text(
                          'Go',
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: ThemeColors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    )
                  : IconButton(
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
