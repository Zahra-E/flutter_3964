import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
//import 'login.dart';
import 'custom_widget.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const SignUp(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      themeMode: _mode,
      home: HomePage(
        isDark: _mode == ThemeMode.dark,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            IconButton(
              icon: Icon(Icons.arrow_back_ios, size: 24),
              onPressed: () {
                // Handle back navigation
              },
            ),
            SizedBox(height: 20),
            Text(
              "title_text".tr(),
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.headlineLarge?.color,
              ),
            ),
            SizedBox(height: 8),
            Text(
              "subtitle_text".tr(),
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
            CustomInputField(
              placeholderText: "full_name".tr(),
              icon: Icons.person,
              keyboardType: TextInputType.name,
            ),
            CustomInputField(
              placeholderText: "phone_number".tr(),
              icon: Icons.phone,
              keyboardType: TextInputType.phone,
            ),
            CustomInputField(
              placeholderText: "password".tr(),
              icon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              visibilityToggle: true,
            ),
            CustomInputField(
              placeholderText: "confirm_password".tr(),
              icon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              visibilityToggle: true,
            ),
            CustomInputField(
              placeholderText: "email".tr(),
              icon: Icons.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {},
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: "agree_terms".tr(),
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      children: [
                        TextSpan(
                          text: "terms".tr(),
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            CustomElevatedButton(
              text: "send_otp".tr(),
              onPressed: () {},
              height: 50,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "already_have_account".tr(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  },
                  child: Text(
                    "sign_in".tr(),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
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
            SizedBox(
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
            SizedBox(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "dont_have_account".tr(),
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: Text(
                    "sign_up".tr(),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
