import 'package:flutter/material.dart';
import 'package:islamy/UI/Providers/lang_provider.dart';
import 'package:islamy/UI/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class LangButtonSheet extends StatefulWidget {
  const LangButtonSheet({super.key});

  @override
  State<LangButtonSheet> createState() => _LangButtonSheetState();
}

class _LangButtonSheetState extends State<LangButtonSheet> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isDark = provider.isDarkEnabled();
    LangProvider langProvider = Provider.of<LangProvider>(context);

    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [


          Padding(
            padding: const EdgeInsets.only(top: 8.0,bottom: 8.0),
            child: Text("Selected Language: ${ langProvider.currentLocale == 'en' ? 'English' : 'العربية'}", style:
            isDark ? Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.white
            ) :Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.black),
            ),
          ),

          InkWell(
              onTap: () {
                setState(() {
                  langProvider.changeLocale('en');

                });
              },
              child:
                  langProvider.currentLocale == 'en' ?
                    getSelectedItem(context, 'English', isDark)
                  : getUnSelectedItem(context, 'English', isDark)),

          const Divider(
            height: 24,
          ),

          InkWell(
              onTap: () {
                setState(() {
                  langProvider.changeLocale('ar');
                });
              },
              child:
                  langProvider.currentLocale == 'ar' ?
                     getSelectedItem(context, 'العربية', isDark)
                   : getUnSelectedItem(context, 'العربية', isDark),
          ),

        ],
      ),
    );
  }

  Widget getSelectedItem(BuildContext context, String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: isDark
                ? Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary)
                : Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(color: Theme.of(context).colorScheme.primary),
          ),
          Icon(
            Icons.check_circle,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }

  Widget getUnSelectedItem(BuildContext context, String text, bool isDark) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(text,
              style: isDark
                  ? Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.white)
                  : Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: Colors.black)),
          Icon(
            Icons.radio_button_unchecked_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
