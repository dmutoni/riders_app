import 'package:flutter/material.dart';
import 'package:flutter_starter_template/helpers/go_router_navigation_helper.dart';
import 'package:flutter_starter_template/language_constants.dart';
import 'package:flutter_starter_template/localisations/cupertino_localisations_rw.dart';
import 'package:flutter_starter_template/localisations/material_localisations_rw.dart';
import 'package:flutter_starter_template/theme/theme_constants.dart';
import 'package:flutter_starter_template/theme/theme_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
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
      title: 'Flutter starter template',
      debugShowCheckedModeBanner: false,
      theme: getAppTheme(context: context, isDarkTheme: themeMode),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
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
