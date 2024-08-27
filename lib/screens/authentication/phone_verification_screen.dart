import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/data/providers/authentication/authentication_provider.dart';
import 'package:riders_app/enums/widget_configurations/app_button_variant.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:riders_app/helpers/snackbar_helper.dart';
import 'package:riders_app/screens/authentication/set_new_password.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/authentication/otp_verification_screen.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);

class PhoneVerificationScreen extends ConsumerStatefulWidget {
  static const String routeName = '/phoneVerificationScreen';

  const PhoneVerificationScreen({super.key});
  @override
  _VerificationScreen1State createState() => _VerificationScreen1State();
}

class _VerificationScreen1State extends ConsumerState<PhoneVerificationScreen> {
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  int numberOfFields = 5;
  bool clearText = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: GestureDetector(
            onTap: () => context.pop(),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios,
                  color: ThemeColors.grey,
                  size: 25,
                ),
                Text(
                  'Back',
                )
              ],
            ),
          ),
        ),
        leadingWidth: 100,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: Dimens.marginMiddle),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Email Verification',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            Text(
              'Enter your OTP sent to your email',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 50),
            OtpTextField(
              onSubmit: (value) => {
                ref.read(authentionProvider.notifier).copyWith(
                      enteredOtp: value,
                    ),
              },
            ),
            const SizedBox(height: 14),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RichText(
                  overflow: TextOverflow.visible,
                  text: TextSpan(
                    text: 'Didn\'t receive code? ',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ThemeColors.grey,
                        ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Resend again',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: ThemeColors.primaryColor,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(flex: 12),
            AppButton(
              title: 'Verify',
              onTap: () async {
                bool isOtpValid =
                    ref.read(authentionProvider.notifier).verifyOtp();

                if (isOtpValid) {
                  context.pushNamed(SetNewPassword.routeName);

                  ref.read(authentionProvider.notifier).saveUserDetails();
                  return;
                } else {
                  SnackbarHelper.showSnackbar(
                    context: context,
                    message: 'Otp is invalid',
                    level: AppTopSnackbarLevel.warning,
                    variant: AppTopSnackbarVariant.error,
                  );
                  return;
                }
              },
              variant: AppButtonVariant.dark,
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
