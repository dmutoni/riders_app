import 'package:flutter/material.dart';
import 'package:riders_app/enums/widget_configurations/app_button_variant.dart';
import 'package:riders_app/theme/styles.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/values/durations.dart';
import 'package:riders_app/widgets/app_inkwell.dart';

class AppButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final VoidCallback? disabledOnTap;
  final AppButtonVariant variant;
  final bool isLoading;
  final bool isEnabled;
  final bool isVisible;
  final Widget? trailingWidget;
  final bool? awaitOnTap;
  final Widget? leadingWidget;
  final double? height;
  final double? width;
  final Widget? actionIcon;

  const AppButton({
    super.key,
    required this.title,
    required this.onTap,
    this.disabledOnTap,
    this.variant = AppButtonVariant.dark,
    this.isLoading = false,
    this.isEnabled = true,
    this.isVisible = true,
    this.trailingWidget,
    this.awaitOnTap,
    this.leadingWidget,
    this.height,
    this.width,
    this.actionIcon,
  });

  @override
  Widget build(BuildContext context) {
    Color primaryColor = variant.textColor;
    Color backgroundColor = variant.backgroundColor;

    if (!isEnabled) {
      primaryColor = variant.disabledTextColor;
      backgroundColor = variant.disabledBackgroundColor;
    }

    return AnimatedContainer(
      duration: Durations.short2,
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: variant.borderColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(
          Dimens.radiusDefault,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: AppProtectedInkWell.Create(
          onTap: () async {
            if (isLoading) return;
            await Future.delayed(DurationValues.onTapDelay);
            isEnabled ? onTap.call() : disabledOnTap?.call();
          },
          awaitOnTap: awaitOnTap,
          child: AnimatedSize(
            duration: Durations.short2,
            child: Container(
              constraints: BoxConstraints(
                minHeight: isVisible ? height ?? Dimens.inputHeight : 0,
                maxHeight:
                    isLoading ? height ?? Dimens.inputHeight : double.infinity,
              ),
              width: width ?? double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  _buildContent(backgroundColor, primaryColor),
                  if (trailingWidget != null)
                    Padding(
                      padding:
                          const EdgeInsets.only(right: Dimens.marginMedium),
                      child: trailingWidget ?? Container(),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(Color backgroundColor, Color primaryColor) => isLoading
      ? AspectRatio(
          aspectRatio: 1.0,
          child: Padding(
            padding: const EdgeInsets.all(Dimens.marginEigtheen),
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(primaryColor),
              backgroundColor: backgroundColor,
            ),
          ),
        )
      : Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leadingWidget ?? const SizedBox.shrink(),
              if (leadingWidget != null && title.isNotEmpty)
                const SizedBox(
                  width: Dimens.marginSmall,
                ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Styles.h6HeadingBlack.copyWith(color: primaryColor),
              ),
              if (actionIcon != null) actionIcon ?? const SizedBox.shrink(),
            ],
          ),
        );
}
