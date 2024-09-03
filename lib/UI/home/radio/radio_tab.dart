import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab> {
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.02),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(height: MediaQuery .of(context).size.height * 0.2,color: Colors.transparent,),
           Image.asset("assets/images/Radio_image.png"),
           Text(AppLocalizations.of(context)!.quranRadio,style: Theme.of(context).textTheme.titleMedium,),
           Divider(height: MediaQuery .of(context).size.height * 0.02,color: Colors.transparent,),
           Image.asset("assets/images/Radio_buttons.png"),

          ],
        ),
    );


  }
}
