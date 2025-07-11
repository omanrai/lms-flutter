import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:lms/features/language/presentation/bloc/app_language_bloc.dart';
import 'package:lms/features/theme/presentation/bloc/bloc/app_theme_bloc.dart';
import 'package:lms/l10n/app_localizations.dart';

final FlutterLocalization localization = FlutterLocalization.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  runApp(
    MultiBlocListener(
      listeners: [
        BlocProvider(create: (_) => AppLanguageBloc()),
        BlocProvider(create: (_) => AppThemeBloc()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubjectBloc, SubjectState>(
      builder: (context, state) {
        return BlocBuilder<AppLanguageBloc, AppLanguageState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Localization Demo',
              locale: (state as AppLanguageInitialState).locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [
                Locale('es'), // Spanish
                Locale('en'), // English
              ],
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              ),
              themeMode: ThemeMode.dark,
              darkTheme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
              ),

              home: MyHomePage(
                changeLanguage: (locale) {
                  context.read<AppLanguageBloc>().add(
                    AppLanguageChangedEvent(locale),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  final Function(Locale) changeLanguage;

  const MyHomePage({super.key, required this.changeLanguage});

  @override
  Widget build(BuildContext context) {
    final helloText = AppLocalizations.of(context)?.hello ?? "Hola";
    final currentLocale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              final newLocale = currentLocale.languageCode == 'es'
                  ? const Locale('en')
                  : const Locale('es');
              changeLanguage(newLocale);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(helloText, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 20),
            Text(
              currentLocale.languageCode == 'es'
                  ? "Idioma actual: Español"
                  : "Current language: English",
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final newLocale = currentLocale.languageCode == 'es'
                    ? const Locale('en')
                    : const Locale('es');
                changeLanguage(newLocale);
              },
              child: Text(
                currentLocale.languageCode == 'es'
                    ? "Cambiar a inglés"
                    : "Switch to Spanish",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
