import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_input_variant.dart';
import 'package:flutter_starter_template/theme/styles.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:flutter_starter_template/widgets/common/input/app_text_input.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends ConsumerStatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => context.pop(),
          child: const Row(
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.black),
              Text('Back', style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
        leadingWidth: 100,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Text(
              'Sign in with your email or phone number',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 30),
            AppTextInput(
              controller: _emailController,
              label: 'Enter email or phone number',
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Email or Phone Number is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            AppTextInput(
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
            ),
            const SizedBox(height: 10),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget password?',
                style: Styles.errorTextStyleRed,
              ),
            ),
            const SizedBox(height: 20),
            AppButton(title: 'Sign up', onTap: () {}),
            const SizedBox(height: 20),
            const Row(
              children: [
                Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('or'),
                ),
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't have an account?",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ThemeColors.grey,
                      ),
                ),
                Text(
                  'Sign Up ',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: ThemeColors.primaryColor,
                      ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
