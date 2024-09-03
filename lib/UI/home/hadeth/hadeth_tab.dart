import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/UI/home/hadeth/hadeth_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatefulWidget {
   HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
List<Hadeth> allHadeth =[];

@override
  void initState() {

    super.initState();
    readHadith();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Image.asset("assets/images/hadith_headerx1.png"),
         Divider(
          thickness: 2,
          height: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            AppLocalizations.of(context)!.hadethNum,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
          ),
        ),
        Divider(
          thickness: 2,
          height: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Expanded(
            child:
            allHadeth.isNotEmpty ? ListView.separated(

              itemBuilder: (context, index) {
                return  HadethTitle(allHadeth[index]);
              },
              itemCount: allHadeth.length,
              separatorBuilder: (context, index) {
                return Container(
                  width: double.infinity,
                  height: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 64.0),
                  color: Colors.transparent,
                );
              },
            ):
              const  Center(child:  CircularProgressIndicator())
          ,
        ),
      ],
    );
  }

  void readHadith()async {
    String fileContent = await rootBundle.loadString("assets/text/hadeth/ahadeth.txt");
    List<String> seperatedAhadeth = fileContent.trim().split("#");

    for (int i = 0; i < seperatedAhadeth.length; i++) {
      List<String> singleHadeth = seperatedAhadeth[i].trim().split("\n");
      String title = singleHadeth[0];
      singleHadeth.removeAt(0);
      String content = singleHadeth.join("\n");
      Hadeth hadeth = Hadeth(title, content);
      allHadeth.add(hadeth);

    }
    setState(() {

    });
  }
}
  class Hadeth {
    String title;
    String content;
    Hadeth(this.title, this.content);
  }

