import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:riders_app/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/helpers/snackbar_helper.dart';
import 'package:riders_app/screens/authentication/signup_screen.dart';
import 'package:riders_app/screens/home/home_screen.dart';
import 'package:riders_app/theme/styles.dart';
import 'package:riders_app/values/colors.dart';
import 'package:riders_app/values/dimens.dart';
import 'package:riders_app/widgets/common/input/app_button.dart';
import 'package:riders_app/widgets/common/input/app_text_input.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isShowingPassword = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 20),
                  _buildHeaderText(context),
                  const SizedBox(height: 30),
                  _buildEmailInput(),
                  const SizedBox(height: 20),
                  _buildPasswordInput(),
                  const SizedBox(height: 10),
                  _buildForgetPasswordLink(),
                  const SizedBox(height: 20),
                  _buildSigninButton(context),
                  const SizedBox(height: 20),
                  _buildOrDivider(),
                  const SizedBox(height: 20),
                  _buildSignUpLink(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.all(
          Dimens.marginDefault,
        ),
        child: GestureDetector(
          onTap: () => context.pop(),
          child: const Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                size: 15,
              ),
              Text(
                'Back',
              ),
            ],
          ),
        ),
      ),
      leadingWidth: 100,
    );
  }

  Widget _buildHeaderText(BuildContext context) {
    return Text(
      'Sign in with your email or phone number',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildEmailInput() {
    return AppTextInput(
      validateOnInput: true,
      controller: _emailController,
      label: 'Enter email or phone number',
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Email or Phone Number is required';
        }
        return null;
      },
    );
  }

  Widget _buildPasswordInput() {
    return AppTextInput(
      validateOnInput: true,
      controller: _passwordController,
      obscureText: !_isShowingPassword,
      label: 'Enter your password',
      trailingWidgetOverride: IconButton(
        icon: Icon(
          _isShowingPassword ? Icons.visibility : Icons.visibility_off,
        ),
        onPressed: () {
          setState(() {
            _isShowingPassword = !_isShowingPassword;
          });
        },
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Password is required';
        }
        return null;
      },
    );
  }

  Widget _buildForgetPasswordLink() {
    return const Align(
      alignment: Alignment.centerRight,
      child: Text(
        'Forget password?',
        style: Styles.errorTextStyleRed,
      ),
    );
  }

  Widget _buildSigninButton(BuildContext context) {
    return AppButton(
      title: 'Sign In',
      onTap: () async {
        if (_formKey.currentState?.validate() ?? false) {
          try {
            final String password =
                await SecureStorageServiceHelper().password ?? '';

            final String email = await SecureStorageServiceHelper().email ?? '';

            if (_emailController.text != email ||
                _passwordController.text != password) {
              SnackbarHelper.showSnackbar(
                context: context,
                message: 'Wrong email or password',
                level: AppTopSnackbarLevel.warning,
                variant: AppTopSnackbarVariant.error,
              );
              return;
            }
            context.pushNamed(HomeScreen.routeName);
          } catch (e) {
            SnackbarHelper.showSnackbar(
              context: context,
              message: 'An error occurred',
              level: AppTopSnackbarLevel.warning,
              variant: AppTopSnackbarVariant.error,
            );
            return;
          }
        }
      },
    );
  }

  Widget _buildOrDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Colors.grey)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text('or'),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }

  Widget _buildSignUpLink(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have an account?",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ThemeColors.grey,
              ),
        ),
        GestureDetector(
          onTap: () {
            context.pushNamed(SignupScreen.routeName);
          },
          child: Text(
            'Sign Up',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: ThemeColors.primaryColor,
                ),
          ),
        ),
      ],
    );
  }
}
