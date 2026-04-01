import 'package:easy_localization/easy_localization.dart';
import 'package:evently/utils/evently_resources.dart';
import 'package:evently/utils/evently_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/language_provider.dart';
import '../../../providers/theme_provider.dart';
import '../../../utils/evently_assets.dart';
import '../../../utils/evently_size.dart';
import '../../widgets/selected_unselected_style.dart';
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});
  @override
  State<HomeTab> createState() => _HomeTabState();
}
class _HomeTabState extends State<HomeTab> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    var themeProvider=Provider.of<ThemeProvider>(context);
    var langProvider=Provider.of<LanguageProvider>(context);
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width*0.04
      ),
      child: Column(
        children: [
          SizedBox(height: context.height*0.05,),
          Row(
            children: [
              Column(
                spacing: context.height*0.008,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('welcome_back'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,),
                  Text('john Cena',
                  style: Theme.of(context).textTheme.bodyLarge,),
                ],
              ),
              Spacer(),
              themeProvider.themeMode==ThemeMode.light?Icon(Icons.light_mode_outlined,size: 30,color: EventlyColors.main_blue,):Icon(Icons.dark_mode_outlined,size: 30,color:EventlyColors.main_dark_blue ,),
              SizedBox(width: context.width*0.02,),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: context.width*0.02,
                  vertical: context.height*0.01
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: themeProvider.themeMode==ThemeMode.light?EventlyColors.main_blue:EventlyColors.main_dark_blue,
                ),
                child: Text(langProvider.lang=='en'?'EN':'AR',
                style: EventlyStyles.bold20white.copyWith(
                  fontSize: 14
                ),),
              )
            ],
          ),
          SizedBox(height:context.height*0.05,),
          SizedBox(
            height: context.height*0.05,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
           return GestureDetector(
                onTap: (){
                  selectedIndex=index;
                  setState(() {
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: context.height*0.01,
                    horizontal: context.width*0.02
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                    color:selectedItem(index, themeProvider,selectedIndex)
                  ),
                  child: Row(
                    spacing: context.width*0.02,
                    children: [
                     selectedIcon(index, themeProvider,selectedIndex),
                      Text(EventlyResources.TexthomeListView[index].tr(),
                      style: selectedText(index, themeProvider, selectedIndex))
                    ],
                  ),
                ),
              );
            }
                , separatorBuilder:(context, index) => SizedBox(
                  width: context.width*0.02,
                )
                , itemCount: EventlyResources.TexthomeListView.length),
          ),
          SizedBox(height: context.height*0.05,),
          Expanded(child: EventlyResources.listViewItemList[selectedIndex])
        ],
      ),
    );
  }
}