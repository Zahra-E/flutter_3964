import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
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
  ThemeMode _mode = ThemeMode.light;

  void _toggleTheme(bool isDark) {
    setState(() {
      _mode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData.light(useMaterial3: true), // light mode
      darkTheme: ThemeData.dark(useMaterial3: true), // dark mode
      themeMode: _mode, // follow the device setting
      home: HomePage(
        isDark: _mode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  final bool isDark;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    super.key,
    required this.isDark,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 24, right: 24),
        child: Column(
          children: [
            Container(
              height: 200,
              width: 200,
              child: Image.asset(
                "assets/Screenshot_7-5-2026_223910_www.figma.com.jpeg",
              ),
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'phone_number'.tr(),
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
            ),
            SizedBox(height: 24),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                labelText: 'password'.tr(),
                filled: true,
                fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "forgot_password".tr(),
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  fixedSize: Size.fromHeight(50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "login".tr(),
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("or".tr()),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  fixedSize: Size.fromHeight(50),
                  side: BorderSide(
                    color: Theme.of(context).colorScheme.error,
                    width: 3,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 24,
                      width: 24,
                      child: Image.asset("assets/48131.png"),
                    ),
                    SizedBox(width: 5),
                    Text(
                      "google".tr(),
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.error,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (context.locale == const Locale('en')) {
                  context.setLocale(const Locale('ar'));
                } else {
                  context.setLocale(const Locale('en'));
                }
              },
              child: Text('switch_language'.tr()),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.light_mode),
                SizedBox(width: 8),
                Switch(value: isDark, onChanged: onThemeChanged),
                SizedBox(width: 8),
                Icon(Icons.dark_mode),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
