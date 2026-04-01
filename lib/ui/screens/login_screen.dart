import 'package:easy_localization/easy_localization.dart';
import 'package:evently/ui/widgets/customed_text_form_field.dart';
import 'package:evently/ui/widgets/customized_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/language_provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/evently_assets.dart';
import '../../utils/evently_size.dart';
import '../../utils/evently_styles.dart';
import '../../utils/evently_routes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var langProvider = Provider.of<LanguageProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: context.height * 0.08, horizontal: context.width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              spacing: context.height * 0.02,
              children: [
                themeProvider.themeMode == ThemeMode.light
                    ? Image.asset(EventlyAssets.evently)
                    : Image.asset(EventlyAssets.dark_evently),
                SizedBox(
                  height: context.height * 0.01,
                ),
                Align(
                  alignment: langProvider.lang == 'en'
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Text(
                    'login_to_account'.tr(),
                    style: Theme.of(context).textTheme.displaySmall,
                  ),
                ),
                CustomedTextFormField(
                    hintText: 'enter_email'.tr(),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                    )),
                Column(
                  spacing: 0,
                  children: [
                    CustomedTextFormField(
                      hintText: 'enter_password'.tr(),
                      prefixIcon: Icon(
                        Icons.lock_outline,
                      ),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                    ),
                    Align(
                      alignment: langProvider.lang == 'en'
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            minimumSize: Size.zero,
                          ),
                          child: Text(
                            'forgot_password'.tr(),
                            style: themeProvider.themeMode == ThemeMode.light
                                ? EventlyStyles.regular14main_blue
                                : EventlyStyles.regular14main_dark_blue,
                          )),
                    ),
                  ],
                ),
                SizedBox(
                  height: context.height * 0.02,
                ),
                CustomizedElevatedButton(
                    child: Text(
                  'login'.tr(),
                  style: EventlyStyles.bold20white.copyWith(
                      fontWeight: FontWeight.w500, fontSize: 16),
                )),
                SizedBox(height:context.height*0.02 ,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('dont_have_account'.tr(),
                        style: Theme.of(context).textTheme.bodyMedium),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed((EventlyRoutes.registerScreen));
                        },
                        style: TextButton.styleFrom(
                          padding:  EdgeInsets.symmetric(horizontal: context.width*0.01),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          minimumSize: Size.zero,
                        ),
                        child: Text(
                          'sign_up'.tr(),
                          style: themeProvider.themeMode == ThemeMode.light
                              ? EventlyStyles.regular14main_blue.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold)
                              : EventlyStyles.regular14main_dark_blue.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(child: Divider(
                      color: themeProvider.themeMode==ThemeMode.light?EventlyColors.lightStroke:EventlyColors.dark_stroke,
                      endIndent: context.width*0.04,
                    )),
                    Text('or'.tr(),
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontWeight: FontWeight.w500
                    ),),
                    Expanded(child: Divider(
                      indent:  context.width*0.04,
                      color: themeProvider.themeMode==ThemeMode.light?EventlyColors.lightStroke:EventlyColors.dark_stroke,
                    ))
                  ],
                ),
                CustomizedElevatedButton2(child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: context.width*0.04,
                  children: [
                    Image.asset(EventlyAssets.google),
                    Text('login_with_google'.tr(),
                      style: EventlyStyles.bold20white.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 16,
                      color: themeProvider.themeMode==ThemeMode.light?EventlyColors.main_blue:EventlyColors.main_dark_blue),)
                  ],
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
