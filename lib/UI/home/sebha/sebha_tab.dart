import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:islamy/UI/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  double sebhaRotationTurn = 0.0;
  int tasbehCount = 0;
  int index = 0;
  List<String> azkar = [
    "سبحان الله",
    " الحمد لله",
    "الله أكبر",
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider provider = Provider.of<ThemeProvider>(context);
    bool isDark = provider.isDarkEnabled();
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1.0),
                  child: Image.asset(isDark
                      ? "assets/icons/1x/sebha_head_dark.png"
                      : "assets/icons/1x/sebha_head.png"),
                ),
                Padding(
                  padding:  isDark? const EdgeInsets.only(top: 75.0): const EdgeInsets.only(top: 35.0),
                  child: AnimatedRotation(
                      turns: sebhaRotationTurn,
                      duration: const Duration(seconds: 1),
                      child: Image.asset(isDark ? "assets/icons/1x/sebh_body_dark.png" : "assets/icons/1x/sebah_body_light.png")),
                ),
              ],
            ),
            Padding(
              padding: isDark? const EdgeInsets.only(top: 25.0): const EdgeInsets.only(top: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).primaryColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    " ${AppLocalizations.of(context)?.praiseNum}: $tasbehCount  ",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ElevatedButton(
                onPressed: () {
                  setState(() => sebhaRotationTurn += 1 / 33);
                  {
                    tasbehCount++;
                    if (tasbehCount == 33) {
                      index++;
                      tasbehCount = 0;
                    }
                    if (index == 3) {
                      index = 0;
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor),
                child: Text(azkar[index],
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
