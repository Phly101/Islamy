import 'package:flutter/material.dart';
import 'package:islamy/UI/Providers/lang_provider.dart';
import 'package:islamy/UI/Providers/theme_provider.dart';
import 'package:islamy/UI/home/settings/button_sheet_logic/lang_button_sheet.dart';
import 'package:islamy/UI/home/settings/button_sheet_logic/theme_button_sheet.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isDark = provider.isDarkEnabled();
    LangProvider langProvider = Provider.of<LangProvider>(context);
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.themeTab,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Divider(
              color: Colors.transparent,
              height: MediaQuery.sizeOf(context).height * 0.02),
          InkWell(
            onTap: () {
              showThemeButtonSheet(context);
            },
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                  color: Theme.of(context).cardColor,
                ),
                child: Text(
                  isDark
                      ? AppLocalizations.of(context)!.darkTab
                      : AppLocalizations.of(context)!.lightTab,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Theme.of(context).colorScheme.secondary),
                )),
          ),
          Divider(
              color: Colors.transparent,
              height: MediaQuery.sizeOf(context).height * 0.02),
          Text(AppLocalizations.of(context)!.languageTab),
          Divider(
              color: Colors.transparent,
              height: MediaQuery.sizeOf(context).height * 0.02),
          InkWell(
            onTap: () {
              showLangButtonSheet(context);
            },
            child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: Theme.of(context).colorScheme.secondary,
                      width: 2,
                    ),
                    color: Theme.of(context).cardColor),
                child: Text(
                  langProvider.currentLocale == 'en'?
                  AppLocalizations.of(context)!.englishTab
                  :AppLocalizations.of(context)!.arabicTab
                  ,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                )),
          ),
        ],
      ),
    );
  }

  void showThemeButtonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const ThemeButtonSheet();
        });
  }

  void showLangButtonSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return const LangButtonSheet();
        });
  }
}
