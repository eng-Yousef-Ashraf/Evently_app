import 'package:easy_localization/easy_localization.dart';
import 'package:evently/prefs/lang_pref.dart';
import 'package:evently/prefs/theme_pref.dart';
import 'package:evently/prefs/welcome_pref.dart';
import 'package:evently/providers/language_provider.dart';
import 'package:evently/providers/theme_provider.dart';
import 'package:evently/ui/screens/add_event_screen.dart';
import 'package:evently/ui/screens/home_screen.dart';
import 'package:evently/ui/screens/login_screen.dart';
import 'package:evently/ui/screens/register_screen.dart';
import 'package:evently/ui/screens/welcome_screen/welcome_screen.dart';
import 'package:evently/utils/evently_routes.dart';
import 'package:evently/utils/evently_themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final isDark = await ThemePref.getTheme();
  final lang = await LangPref.getLang();
  final isSeenWelcome = await WelcomePref.isSeenWelcome();
  runApp( EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale('en'),
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => LanguageProvider(lang: lang == true ? 'ar' : 'en')),
            ChangeNotifierProvider(create: (context) => ThemeProvider(themeMode:isDark == true ? ThemeMode.dark : ThemeMode.light,)),
          ],
          child: MyApp(isSeenWelcome: isSeenWelcome!))));
}

class MyApp extends StatelessWidget {
 final bool isSeenWelcome;
  MyApp({super.key,required this.isSeenWelcome});
  @override
  Widget build(BuildContext context) {
    var langProvider=Provider.of<LanguageProvider>(context);
    var themeProvider=Provider.of<ThemeProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: langProvider.lang=='en'?Locale('en'):Locale('ar'),
      initialRoute: isSeenWelcome==true?EventlyRoutes.loginScreen:EventlyRoutes.welcomeScreen,
      routes: {
        EventlyRoutes.welcomeScreen: (context) =>  WelcomeScreen(),
        EventlyRoutes.homeScreen: (context) => const HomeScreen(),
        EventlyRoutes.addEventScreen: (context) => AddEventScreen(),
        EventlyRoutes.loginScreen: (context) => const LoginScreen(),
        EventlyRoutes.registerScreen: (context) => const RegisterScreen(),
      },
      theme:lightTheme ,
      darkTheme:darkTheme ,
      themeMode:themeProvider.themeMode ,
    );
  }
}