import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/helpers/email_validation_helper.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:flutter_starter_template/screens/authentication/phone_verification_screen.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_text_input.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';

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
  final _formKey = GlobalKey<FormState>();

  final bool _isShowingPassword = true;

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
              validateOnInput: true,
            ),
            AppTextInput(
              obscureText: _isShowingPassword,
              controller: _passwordController,
              label: 'Password',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Password is required';
                }
                if (value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
              validateOnInput: true,
            ),
            _buildFullScreenDropdown(),
            _buildDropdownButtonFormField(),
          ],
        ),
      ],
    );
  }

  Widget _buildFullScreenDropdown() {
    final controller = TextEditingController();
    String? selectedValue;
    final options = ['Option 1', 'Option 2', 'Option 3'];

    return TextFormField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        labelText: 'Select an option',
        suffixIcon: IconButton(
          icon: const Icon(Icons.arrow_drop_down),
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FullScreenDropdown(
                  options: options,
                  selectedValue: selectedValue,
                ),
              ),
            );
            if (result != null) {
              setState(() {
                selectedValue = result;
                controller.text = result;
              });
            }
          },
        ),
      ),
    );
  }

  Widget _buildDropdownButtonFormField() {
    String? selectedValue;

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      ),
      value: selectedValue,
      items: ['Male', 'Female']
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
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
      onTap: () async {
        if (_formKey.currentState?.validate() ?? false) {
          try {
            context.pushNamed(PhoneVerificationScreen.routeName);
          } catch (e) {
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
}

class FullScreenDropdown extends StatelessWidget {
  final List<String> options;
  final String? selectedValue;

  const FullScreenDropdown(
      {super.key, required this.options, this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select an Option'),
      ),
      body: ListView.builder(
        itemCount: options.length,
        itemBuilder: (context, index) {
          final option = options[index];
          return ListTile(
            title: Text(option),
            selected: option == selectedValue,
            onTap: () => Navigator.pop(context, option),
          );
        },
      ),
    );
  }
}
