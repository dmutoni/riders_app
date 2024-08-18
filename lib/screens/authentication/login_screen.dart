import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:flutter_starter_template/helpers/config.dart';
import 'package:flutter_starter_template/helpers/email_validation_helper.dart';
import 'package:flutter_starter_template/helpers/snackbar_helper.dart';
import 'package:flutter_starter_template/repository/auth_repository.dart';
import 'package:flutter_starter_template/theme/theme_constants.dart';
import 'package:flutter_starter_template/theme/theme_manager.dart';
import 'package:flutter_starter_template/values/assets/login_assets.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_text_input.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';

enum InputLabelVariant { label, hint }

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool _isShowingPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var isDarkMode = ref.watch(themeModeProvider);
    var auth = ref.watch(authenticationProvider);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          ref.read(themeModeProvider.notifier).state =
                              isDarkMode ? false : true;
                        },
                        icon: Icon(
                          isDarkMode ? Icons.light_mode : Icons.dark_mode,
                          color: isDarkMode
                              ? ThemeColors.white
                              : ThemeColors.black,
                        ),
                      ),
                    ),
                    Center(
                      child: SvgPicture.asset(
                        LoginAssets.teddyBear,
                        height: 100,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'Welcome back!',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: colors(context).textColor,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...intersperse(
                      const SizedBox(
                        height: Dimens.marginSmall,
                      ),
                      [
                        Text(
                          'E-mail address',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        AppTextInput(
                          controller: _emailController,
                          trailingWidgetOverride: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.email_outlined,
                            ),
                          ),
                          label: 'Enter your email',
                          validator: (value) {
                            if (value!.isEmpty) return 'Email is required';
                            if (!isEmailValid(value)) {
                              return 'Please enter a valid email';
                            }

                            return null;
                          },
                          validateOnInput: true,
                        ),
                        Text(
                          'Password',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        AppTextInput(
                          obscureText: _isShowingPassword,
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
                          validator: (value) =>
                              value!.isEmpty ? 'Password is required' : null,
                          validateOnInput: true,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1.0,
                              width: 150.0,
                              color: ThemeColors.grey,
                            ),
                            Text(
                              'Or',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            Container(
                              height: 1.0,
                              width: 150.0,
                              color: ThemeColors.grey,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppButton(
                              title: '',
                              onTap: () {
                                ref
                                    .read(authenticationProvider.notifier)
                                    .signInWithGoogle();
                              },
                              variant: AppButtonVariant.light,
                              leadingWidget: SvgPicture.asset(
                                LoginAssets.googleLogo,
                                height: 15.0,
                                width: 15.0,
                              ),
                              width: 60.0,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            AppButton(
                              title: '',
                              onTap: () {},
                              variant: AppButtonVariant.light,
                              leadingWidget: const Icon(
                                Icons.apple,
                                color: ThemeColors.black,
                              ),
                              width: 60.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    AppButton(
                      title: 'Log in',
                      isLoading: auth.isLoading,
                      onTap: () async {
                        if (!_formKey.currentState!.validate()) return;
                        try {
                          await ref
                              .read(authenticationProvider.notifier)
                              .signInWithEmailAndPassword(
                                  email: _emailController.text,
                                  password: _passwordController.text);
                        } on FirebaseAuthException catch (e) {
                          Map<String, String> errorMessages = {
                            'INVALID_LOGIN_CREDENTIALS': 'Invalid credentials',
                            'USER_DISABLED': 'User is disabled',
                            'INVALID_EMAIL': 'Invalid email',
                            'INVALID_PASSWORD': 'Invalid password',
                          };

                          String message =
                              errorMessages[e.code] ?? 'Something went wrong';

                          SnackbarHelper.showSnackbar(
                            message: message,
                            level: AppTopSnackbarLevel.alert,
                            variant: AppTopSnackbarVariant.error,
                            context: context,
                          );
                        }
                        return;
                      },
                      variant: AppButtonVariant.dark,
                      actionIcon: const Icon(
                        Icons.arrow_right_alt,
                        color: ThemeColors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 18.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        context.go(
                          AppRoutes.signupScreenRouteName,
                        );
                      },
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: 'Don\'t have an account? ',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: [
                              TextSpan(
                                text: 'Sign up now.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ThemeColors.blue,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
