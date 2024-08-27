import 'package:flutter/material.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/values/durations.dart';

class AppTopSnackbar extends StatefulWidget {
  final String message;
  final VoidCallback onDismissed;
  final AppTopSnackbarVariant variant;
  final Duration closeInterval;

  const AppTopSnackbar({
    Key? key,
    required this.message,
    required this.onDismissed,
    this.variant = AppTopSnackbarVariant.message,
    this.closeInterval = DurationValues.carouselInterval,
  }) : super(key: key);

  @override
  _AppTopSnackbarState createState() => _AppTopSnackbarState();
}

class _AppTopSnackbarState extends State<AppTopSnackbar>
    with SingleTickerProviderStateMixin {
  late Animation<Offset> offsetAnimation;
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: DurationValues.slow,
    );

    Tween<Offset> offsetTween = Tween<Offset>(
      begin: const Offset(0.0, -0.2),
      end: const Offset(0.0, 0.015),
    );

    offsetAnimation = offsetTween.animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    )..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          await Future.delayed(widget.closeInterval);
          if (mounted) {
            animationController.reverse();
          }
        }

        if (status == AnimationStatus.dismissed) {
          widget.onDismissed.call();
        }
      });

    if (mounted) {
      animationController.forward();
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: offsetAnimation,
      child: SafeArea(
        child: Material(
          type: MaterialType.transparency,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 345,
              constraints: const BoxConstraints(
                minHeight: 40,
              ),
              decoration: BoxDecoration(
                color: widget.variant.backgroundColor,
                borderRadius: BorderRadius.circular(
                  Dimens.marginSmall,
                ),
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimens.marginDefault,
                  vertical: Dimens.marginSmall,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: Dimens.marginLarge,
                    ),
                    Expanded(
                      child: Text(
                        widget.message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: ThemeColors.white,
                            ),
                      ),
                    ),
                    SizedBox(
                      width: Dimens.marginLarge,
                      child: MaterialButton(
                        onPressed: () async {
                          await Future.delayed(DurationValues.onTapDelay);
                          animationController.reverse();
                        },
                        shape: const CircleBorder(),
                        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                        child: const Icon(
                          Icons.close,
                          size: Dimens.marginDefault,
                          color: ThemeColors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
