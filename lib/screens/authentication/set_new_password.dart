import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riders_app/enums/widget_configurations/app_button_variant.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/helpers/snackbar_helper.dart';
import 'package:riders_app/screens/authentication/login_screen.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';

class SetNewPassword extends ConsumerStatefulWidget {
  static const String routeName = '/setNewPassword';

  const SetNewPassword({
    super.key,
  });

  @override
  ConsumerState<SetNewPassword> createState() => _SetNewPasswordState();
}

class _SetNewPasswordState extends ConsumerState<SetNewPassword> {
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isShowingPassword = true;
  bool _isShowingConfirmPassword = true;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Text(
                        'Set New Password',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'Set new password',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 20),
                      AppTextInput(
                        obscureText: !_isShowingPassword,
                        controller: _passwordController,
                        trailingWidgetOverride: IconButton(
                          onPressed: () => setState(
                            () => _isShowingPassword = !_isShowingPassword,
                          ),
                          icon: _isShowingPassword
                              ? const Icon(
                                  Icons.visibility_outlined,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                ),
                        ),
                        label: 'Enter your password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password is required';
                          } else if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          } else if (!RegExp(r'[0-9]').hasMatch(value) &&
                              !RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                                  .hasMatch(value)) {
                            return 'Password must contain at least one number or one special character';
                          }
                          return null;
                        },
                        validateOnInput: true,
                      ),
                      const SizedBox(height: 10),
                      AppTextInput(
                        controller: _confirmPasswordController,
                        obscureText: !_isShowingConfirmPassword,
                        trailingWidgetOverride: IconButton(
                          onPressed: () => setState(
                            () => _isShowingConfirmPassword =
                                !_isShowingConfirmPassword,
                          ),
                          icon: _isShowingConfirmPassword
                              ? const Icon(
                                  Icons.visibility_outlined,
                                )
                              : const Icon(
                                  Icons.visibility_off_outlined,
                                ),
                        ),
                        label: 'Confirm your password',
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Confirm password is required';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        validateOnInput: true,
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'At least one special character or a number',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                AppButton(
                  title: 'Save',
                  onTap: () async {
                    if (!_formKey.currentState!.validate()) return;
                    try {
                      SecureStorageServiceHelper()
                          .setPassword(password: _passwordController.text);

                      context.pushNamed(LoginScreen.routeName);
                    } catch (e) {
                      SnackbarHelper.showSnackbar(
                        message: 'An error occurred',
                        level: AppTopSnackbarLevel.alert,
                        variant: AppTopSnackbarVariant.error,
                        context: context,
                      );
                    }
                  },
                  variant: AppButtonVariant.dark,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
