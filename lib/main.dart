import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:lms/core/themes/app_theme.dart';
import 'package:lms/features/language/presentation/bloc/app_language_bloc.dart';
import 'package:lms/features/login/presentation/pages/login_page.dart';
import 'package:lms/features/login/presentation/bloc/login_bloc.dart';
import 'package:lms/features/theme/presentation/bloc/bloc/app_theme_bloc.dart';
import 'package:lms/injection_container.dart';
import 'package:lms/l10n/app_localizations.dart';

final FlutterLocalization localization = FlutterLocalization.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterLocalization.instance.ensureInitialized();
  await init();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<AppLanguageBloc>()),
        BlocProvider(create: (_) => sl<AppThemeBloc>()),
        BlocProvider(create: (_) => sl<LoginBloc>()),
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
    return BlocBuilder<AppThemeBloc, AppThemeState>(
      builder: (context, themeState) {
        final currentTheme = themeState is AppThemeInitial
            ? themeState.themeMode
            : ThemeMode.light;
        return BlocBuilder<AppLanguageBloc, AppLanguageState>(
          builder: (context, langState) {
            final locale = langState is AppLanguageInitialState
                ? langState.locale
                : const Locale('en');
            return MaterialApp(
              title: 'Theme Visualizer',
              locale: locale,
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: const [Locale('es'), Locale('en')],
              theme: AppTheme.lightTheme,
              darkTheme: AppTheme.darkTheme,
              themeMode: currentTheme,
              home: const LoginPage(),
            );
          },
        );
      },
    );
  }
}

class ThemeVisualizerPage extends StatelessWidget {
  const ThemeVisualizerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final currentLocale = Localizations.localeOf(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n?.themeVisualizer ?? 'Theme Visualizer'),
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () => context.read<AppThemeBloc>().add(
              AppThemeChangedEvent(isDark ? ThemeMode.light : ThemeMode.dark),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () => context.read<AppLanguageBloc>().add(
              AppLanguageChangedEvent(
                currentLocale.languageCode == 'es'
                    ? const Locale('en')
                    : const Locale('es'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Color Palette Section
            Text(
              l10n?.colorScheme ?? 'Color Scheme',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildColorTile(
              l10n?.primary ?? 'Primary',
              colorScheme.primary,
              colorScheme.onPrimary,
            ),
            _buildColorTile(
              l10n?.primaryContainer ?? 'Primary Container',
              colorScheme.primaryContainer,
              colorScheme.onPrimaryContainer,
            ),
            _buildColorTile(
              l10n?.secondary ?? 'Secondary',
              colorScheme.secondary,
              colorScheme.onSecondary,
            ),
            _buildColorTile(
              l10n?.secondaryContainer ?? 'Secondary Container',
              colorScheme.secondaryContainer,
              colorScheme.onSecondaryContainer,
            ),
            _buildColorTile(
              l10n?.surface ?? 'Surface',
              colorScheme.surface,
              colorScheme.onSurface,
            ),
            _buildColorTile(
              l10n?.surfaceVariant ?? 'Surface Variant',
              colorScheme.surfaceContainerHighest,
              colorScheme.onSurface,
            ),
            _buildColorTile(
              l10n?.background ?? 'Background',
              colorScheme.surface,
              colorScheme.onSurface,
            ),
            _buildColorTile(
              l10n?.error ?? 'Error',
              colorScheme.error,
              colorScheme.onError,
            ),

            const SizedBox(height: 24),

            // Typography Section
            Text(
              l10n?.typography ?? 'Typography',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            _buildTextSample('Display Large', textTheme.displayLarge),
            _buildTextSample('Display Medium', textTheme.displayMedium),
            _buildTextSample('Headline Small', textTheme.headlineSmall),
            _buildTextSample('Title Large', textTheme.titleLarge),
            _buildTextSample('Body Large', textTheme.bodyLarge),
            _buildTextSample('Body Medium', textTheme.bodyMedium),
            _buildTextSample('Label Large', textTheme.labelLarge),

            const SizedBox(height: 24),

            // Components Section
            Text(
              l10n?.components ?? 'Components',
              style: textTheme.headlineSmall,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: Text(l10n?.elevatedButton ?? 'Elevated Button'),
            ),
            const SizedBox(height: 8),
            FilledButton(
              onPressed: () {},
              child: Text(l10n?.filledButton ?? 'Filled Button'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {},
              child: Text(l10n?.outlinedButton ?? 'Outlined Button'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              child: Text(l10n?.textButton ?? 'Text Button'),
            ),
            const SizedBox(height: 16),
            SwitchListTile(
              title: Text(l10n?.switchText ?? 'Switch'),
              value: true,
              onChanged: (_) {},
            ),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                labelText: l10n?.textField ?? 'Text Field',
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(l10n?.card ?? 'Card', style: textTheme.bodyLarge),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildColorTile(String label, Color color, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildTextSample(String label, TextStyle? style) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(label, style: style),
    );
  }
}
