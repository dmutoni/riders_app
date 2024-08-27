import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riders_app/helpers/go_router_navigation_helper.dart';
import 'package:riders_app/helpers/secure_storage_service_helper.dart';
import 'package:riders_app/language_constants.dart';
import 'package:riders_app/localisations/cupertino_localisations_rw.dart';
import 'package:riders_app/localisations/material_localisations_rw.dart';
import 'package:riders_app/screens/authentication/welcome_screen.dart';
import 'package:riders_app/screens/onboarding/location_onboarding_screen.dart';
import 'package:riders_app/theme/theme_constants.dart';
import 'package:riders_app/theme/theme_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: RidersApp()));
}

class RidersApp extends ConsumerStatefulWidget {
  const RidersApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _RidersAppState? state = context.findAncestorStateOfType<_RidersAppState>();
    state?.setLocale(newLocale);
  }

  @override
  ConsumerState<RidersApp> createState() => _RidersAppState();
}

class _RidersAppState extends ConsumerState<RidersApp> {
  Locale? _locale;

  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) => setLocale(locale));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeModeProvider);
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Rider\'s app',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context: context, isDarkTheme: themeMode),
      localizationsDelegates: const [
        ...AppLocalizations.localizationsDelegates,
        MaterialLocalizationsRw.delegate,
        CupertinoLocalizationsRw.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: _locale,
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _navigateBasedOnOnboarding();
    });
  }

  Future<void> _navigateBasedOnOnboarding() async {
    try {
      final isOnboarded = await SecureStorageServiceHelper().isOnboarded;

      if (isOnboarded) {
        _navigateToHome();
      } else {
        _navigateToOnboarding();
      }
    } catch (e) {
      print('Error during onboarding check: $e');
    }
  }

  void _navigateToHome() {
    context.pushNamed(WelcomeScreen.routeName);
  }

  void _navigateToOnboarding() {
    context.pushNamed(LocationOnboardingScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
