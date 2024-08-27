import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';
import 'package:riders_app/data/providers/authentication/authentication_provider.dart';
import 'package:riders_app/enums/widget_configurations/app_button_variant.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:riders_app/helpers/email_validation_helper.dart';
import 'package:riders_app/helpers/snackbar_helper.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/screens/authentication/phone_verification_screen.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';
import 'package:riders_app/widgets/common/input/phone_text_input.dart';

class SignupScreen extends ConsumerStatefulWidget {
  static const String routeName = '/signupScreen';

  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? selectedGender;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimens.marginDefault),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => context.pop(),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: ThemeColors.grey,
                        size: 15,
                      ),
                      Text(
                        'Back',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: ThemeColors.grey,
                            ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: Dimens.marginLarge),
                Text(
                  'Sign up with your email or phone number',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: Dimens.marginLarge),
                _buildTextInputs(),
                const SizedBox(height: Dimens.marginLarge),
                _buildTermsOfService(context),
                const SizedBox(height: Dimens.marginLarge),
                _buildSignUpButton(context),
                const SizedBox(height: Dimens.marginMedium),
                _buildOrDivider(),
                const SizedBox(height: Dimens.marginBig),
                _buildSignInLink(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextInputs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...intersperse(
          const SizedBox(height: Dimens.marginSmall),
          [
            AppTextInput(
              controller: _nameController,
              labelColor: ThemeColors.lightGrey,
              label: 'Name',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Name is required';
                return null;
              },
              onChanged: (value) {
                ref.read(authentionProvider.notifier).copyWith(
                      name: value,
                    );
              },
              validateOnInput: true,
            ),
            AppTextInput(
              controller: _emailController,
              label: 'Email',
              validator: (value) {
                if (value == null || value.isEmpty) return 'Email is required';
                if (!isEmailValid(value)) return 'Email is invalid';
                return null;
              },
              onChanged: (value) {
                ref.read(authentionProvider.notifier).copyWith(
                      email: value,
                    );
              },
              validateOnInput: true,
            ),
            PhoneNumberInput(
              phoneController: _phoneController,
            ),
            _buildDropdownButtonFormField(),
          ],
        ),
      ],
    );
  }

  Widget _buildTermsOfService(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.check_circle_outline, color: ThemeColors.green2),
        const SizedBox(width: Dimens.marginSmall),
        Expanded(
          child: RichText(
            text: TextSpan(
              text: 'By signing up, you agree to the ',
              style: Theme.of(context).textTheme.bodySmall,
              children: [
                TextSpan(
                  text: 'Terms of Service ',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ThemeColors.green3),
                ),
                TextSpan(
                  text: 'and ',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextSpan(
                  text: 'Privacy Policy.',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: ThemeColors.green),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton(BuildContext context) {
    return AppButton(
      title: 'Sign up',
      isLoading: ref.watch(authentionProvider).isSendingOtp ?? false,
      onTap: () async {
        if (_formKey.currentState?.validate() ?? false) {
          try {
            await ref.read(authentionProvider.notifier).sendOtpToUser(
                  _emailController.text,
                );

            ref.read(authentionProvider.notifier).copyWith(
                  phoneNumber: _phoneController.text,
                );

            context.pushNamed(PhoneVerificationScreen.routeName);
          } catch (e) {
            SnackbarHelper.showSnackbar(
              context: context,
              message: 'Otp is invalid',
              level: AppTopSnackbarLevel.warning,
              variant: AppTopSnackbarVariant.error,
            );
            return;
          }
        }
      },
      variant: AppButtonVariant.dark,
    );
  }

  Widget _buildOrDivider() {
    return const Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.marginSmall),
          child: Text('or'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget _buildSignInLink(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(LoginScreen.routeName);
      },
      child: Center(
        child: RichText(
          text: TextSpan(
            text: 'Already have an account? ',
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: ThemeColors.grey2),
            children: [
              TextSpan(
                text: 'Sign in.',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: ThemeColors.primaryColor,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownButtonFormField() {
    return DropdownButtonFormField<String>(
      dropdownColor: ThemeColors.white,
      focusColor: ThemeColors.white,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      hint: const Text('Select gender'),
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(Dimens.marginSmall)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
      value: selectedGender,
      items: ['Male', 'Female']
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });

        ref.read(authentionProvider.notifier).copyWith(
              gender: value,
            );
      },
      validator: (value) {
        if (value == null) return 'Gender is required';
        return null;
      },
    );
  }
}
