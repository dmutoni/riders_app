import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/screens/authentication/set_new_password.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/authentication/otp_verification_screen.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:go_router/go_router.dart';

const Color primaryColor = Color(0xFF121212);
const Color accentPurpleColor = Color(0xFF6A53A1);
const Color accentPinkColor = Color(0xFFF99BBD);
const Color accentDarkGreenColor = Color(0xFF115C49);
const Color accentYellowColor = Color(0xFFFFB612);
const Color accentOrangeColor = Color(0xFFEA7A3B);

class PhoneVerificationScreen extends StatefulWidget {
  static const String routeName = '/phoneVerificationScreen';

  const PhoneVerificationScreen({super.key});
  @override
  _VerificationScreen1State createState() => _VerificationScreen1State();
}

class _VerificationScreen1State extends State<PhoneVerificationScreen> {
  late List<TextStyle?> otpTextStyles;
  late List<TextEditingController?> controls;
  int numberOfFields = 5;
  bool clearText = false;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
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
              'Phone Verification',
              style: theme.textTheme.titleLarge,
            ),
            const SizedBox(height: 14),
            Text(
              'Enter your OTP code',
              style: theme.textTheme.bodyMedium,
            ),
            const SizedBox(height: 50),
            OtpTextField(
              numberOfFields: numberOfFields,
              borderColor: const Color(0xFF512DA8),
              focusedBorderColor: primaryColor,
              clearText: clearText,
              showFieldAsBox: true,
              textStyle: theme.textTheme.titleMedium,
              onCodeChanged: (String value) {
                //Handle each value
              },
              handleControllers: (controllers) {
                //get all textFields controller, if needed
                controls = controllers;
              },
              onSubmit: (String verificationCode) {
                //set clear text to clear text from all fields
                // setState(() {
                //   clearText = true;
                // });
                //navigate to different screen code goes here
              }, // end onSubmit
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
                context.go(SetNewPassword.routeName);
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
