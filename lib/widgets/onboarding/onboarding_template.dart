import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/onboarding/onboarding_progress_indicator.dart';

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
      appBar: _buildAppBar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        if (appBarTitle != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onButtonTap,
              child: Text(
                appBarTitle!,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      letterSpacing: 1.0,
                      fontSize: 16,
                      color: ThemeColors.grey,
                    ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: Dimens.marginSeventy),
        if (imageAssetPath != null) SvgPicture.asset(imageAssetPath!),
        const SizedBox(height: Dimens.marginMiddle),
        _buildSectionTitle(context),
        const SizedBox(height: Dimens.marginTen),
        _buildSectionDescription(context),
        const Spacer(),
        _buildProgressIndicator(context),
        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildSectionTitle(BuildContext context) {
    return Text(
      sectionTitle ?? '',
      style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 24,
            color: ThemeColors.grey,
          ),
    );
  }

  Widget _buildSectionDescription(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 70),
      child: Text(
        sectionDescription ?? '',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }

  Widget _buildProgressIndicator(BuildContext context) {
    return TwoColorCircleProgressIndicator(
      progress: onboardingProgress ?? 0.0,
      color1: ThemeColors.green,
      color2: ThemeColors.lightGreen,
      size: 86,
      strokeWidth: Dimens.marginFive,
      child: _buildProgressIndicatorChild(context),
    );
  }

  Widget _buildProgressIndicatorChild(BuildContext context) {
    return Container(
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
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
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
            ),
    );
  }
}
