import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_top_snackbar_level.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_top_snackbar_variant.dart';
import 'package:flutter_starter_template/enums/widget_configurations/app_button_variant.dart';
import 'package:flutter_starter_template/helpers/email_validation_helper.dart';
import 'package:flutter_starter_template/helpers/snackbar_helper.dart';
import 'package:flutter_starter_template/repository/auth_repository.dart';
import 'package:flutter_starter_template/screens/authentication/login_screen.dart';
import 'package:flutter_starter_template/screens/authentication/phone_verification_screen.dart';
import 'package:flutter_starter_template/values/colors.dart';
import 'package:flutter_starter_template/values/dimens.dart';
import 'package:flutter_starter_template/widgets/common/input/app_text_input.dart';
import 'package:flutter_starter_template/widgets/common/input/app_button.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intersperse/intersperse.dart';

enum InputLabelVariant { label, hint }

class SignupScreen extends ConsumerStatefulWidget {
  static const String routeName = '/signupScreen';

  const SignupScreen({
    super.key,
  });

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _isShowingPassword = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var auth = ref.watch(authenticationProvider);

    final TextEditingController controller = TextEditingController();
    String? selectedValue;
    final List<String> options = ['Option 1', 'Option 2', 'Option 3'];

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
      body: ListView(
        shrinkWrap: true,
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
                  Text(
                    'Sign up with your email or phone number',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ...intersperse(
                    const SizedBox(
                      height: Dimens.marginSmall,
                    ),
                    [
                      AppTextInput(
                        controller: _nameController,
                        labelColor: ThemeColors.lightGrey,
                        label: 'Name',
                        validator: (value) {
                          if (value!.isEmpty) return 'Name is required';
                          return null;
                        },
                        validateOnInput: true,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextInput(
                        controller: _emailController,
                        label: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) return 'Email is required';
                          if (!isEmailValid(value)) {
                            return 'Email is invalid';
                          }
                          return null;
                        },
                        validateOnInput: true,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      AppTextInput(
                        obscureText: _isShowingPassword,
                        controller: _passwordController,
                        label: 'Email',
                        validator: (value) {
                          if (value!.isEmpty) return 'Password is required';
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                        validateOnInput: true,
                      ),
                      TextFormField(
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
                      ),
                      DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8.0),
                            ),
                          ),
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 16.0),
                        ),
                        value: selectedValue,
                        items: [
                          'Male',
                          'Female',
                        ]
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
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.check_circle_outline,
                        color: ThemeColors.green2,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: RichText(
                          overflow:
                              TextOverflow.visible, // Or TextOverflow.fade
                          text: TextSpan(
                            text: 'By signing up. You agree to the ',
                            style: Theme.of(context).textTheme.bodySmall,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Terms of service ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ThemeColors.green3,
                                    ),
                              ),
                              TextSpan(
                                text: 'and ',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text:
                                    'Privacy policy.', // Default style for the rest
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                      color: ThemeColors.green,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  AppButton(
                    title: 'Sign up',
                    isLoading: auth.isLoading,
                    onTap: () async {
                      try {
                        // if (!_formKey.currentState!.validate()) return;

                        context.go(PhoneVerificationScreen.routeName);
                      } on FirebaseAuthException catch (e) {
                        Map<String, String> errorMessages = {
                          'email-already-in-use':
                              'Email has already been used. Please use another email.',
                          'invalid-email': 'Invalid email used',
                          'weak-password': 'Password is too weak',
                        };

                        String message = errorMessages[e.code] ??
                            'Something went wrong. Please try again.';

                        SnackbarHelper.showSnackbar(
                          message: message,
                          level: AppTopSnackbarLevel.alert,
                          variant: AppTopSnackbarVariant.error,
                          context: context,
                        );
                      }
                    },
                    variant: AppButtonVariant.dark,
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text('or'),
                      ),
                      Expanded(
                        child: Divider(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go(
                        LoginScreen.routeName,
                      );
                    },
                    child: Center(
                      child: RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: ThemeColors.grey2,
                                  ),
                          children: [
                            TextSpan(
                              text: 'Sign in.',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                    color: ThemeColors.primaryColor,
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
            onTap: () {
              Navigator.pop(context, option);
            },
          );
        },
      ),
    );
  }
}
