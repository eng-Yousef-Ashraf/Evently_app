import 'package:evently/utils/evently_assets.dart';
import 'package:evently/utils/evently_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/theme_provider.dart';
import '../../utils/evently_size.dart';
class EventDateTime extends StatelessWidget{
      IconData icon;
      String text;
      String text1;
      EventDateTime({required this.icon, required this.text,required this.text1});
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
      return Row( spacing: context.width*0.01,
      children: [
      Icon(icon,
      color:themeProvider.themeMode==ThemeMode.light?EventlyColors.main_blue:EventlyColors.main_dark_blue ,size: 30,),
      Text(text,
      style: Theme.of(context).textTheme.bodySmall,),
      Spacer(),
      TextButton(onPressed: (){},
      child: Text(text1,
      style: themeProvider.themeMode==ThemeMode.light?EventlyStyles.regular14main_blue:EventlyStyles.regular14main_dark_blue,)),
      ],
      );
  }
}