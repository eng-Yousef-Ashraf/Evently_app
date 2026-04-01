import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/theme_provider.dart';
import '../../../../utils/evently_assets.dart';
import '../../../../utils/evently_size.dart';

class BirthdayPage extends StatelessWidget {
  const BirthdayPage({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
    return ListView.separated(itemBuilder: (context, index) {
      return Container(
        height: context.height*0.3,
        width: context.width*0.3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            border:Border.all(
              color: themeProvider.themeMode==ThemeMode.light?EventlyColors.lightStroke:EventlyColors.dark_stroke,
            ),
            image: DecorationImage(image:themeProvider.themeMode==ThemeMode.light? AssetImage(EventlyAssets.birthday): AssetImage(EventlyAssets.dark_birthday),
                fit: BoxFit.fill)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(
                horizontal: context.width*0.02,
                vertical: context.width*0.02,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: context.height*0.01,
                    horizontal: context.width*0.01
                ),
                decoration: BoxDecoration(
                    color: themeProvider.themeMode==ThemeMode.light?EventlyColors.bg_color:EventlyColors.darkBg_color,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: themeProvider.themeMode==ThemeMode.light?EventlyColors.lightStroke:EventlyColors.dark_stroke,
                    )
                ),
                child: Text('21_jan'.tr(),
                  style: Theme.of(context).textTheme.displayLarge,),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.width*0.02,
                vertical: context.width*0.02,),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                    vertical: context.height*0.01,
                    horizontal: context.width*0.01
                ),
                decoration: BoxDecoration(
                    color: themeProvider.themeMode==ThemeMode.light?EventlyColors.bg_color:EventlyColors.darkBg_color,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(
                      color: themeProvider.themeMode==ThemeMode.light?EventlyColors.lightStroke:EventlyColors.dark_stroke,
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text('birthday_party'.tr(),
                        maxLines: 4,
                        style: Theme.of(context).textTheme.displayLarge,),
                    ),
                    Icon(Icons.favorite_outline,color:themeProvider.themeMode==ThemeMode.light?EventlyColors.main_blue:EventlyColors.main_dark_blue,size: 30,)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    }
        , separatorBuilder:(context, index) =>  SizedBox(height: context.height*0.03)
        , itemCount: 10);
  }
}
