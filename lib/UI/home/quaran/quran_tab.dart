import 'package:flutter/material.dart';
import 'package:islamy/UI/home/quaran/chapter_title.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatefulWidget {
   const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<String> findChapters = [];
  List<String> findAyatNumbers = [];
  var ayatNumber = [
    '7', '286', '200', '176', '120', '165', '206', '75', '129', '109',
    '123', '111', '43', '52', '99', '128', '111', '110', '98', '135',
    '112', '78', '118', '64', '77', '227', '93', '88', '69', '60',
    '34', '30', '73', '54', '45', '83', '182', '88', '75', '85',
    '54', '53', '89', '59', '37', '35', '38', '29', '18', '45',
    '60', '49', '62', '55', '78', '96', '29', '22', '24', '13',
    '14', '11', '11', '18', '12', '12', '30', '52', '52', '44',
    '28', '28', '20', '56', '40', '31', '50', '40', '46', '42',
    '29', '19', '36', '25', '22', '17', '19', '26', '30', '20',
    '15', '21', '11', '8', '5', '19', '5', '8', '8', '11',
    '11', '8', '3', '9', '5', '4', '6', '3', '6', '3',
    '5', '4', '5', '6'
  ];
  var chapterName = [
    "الفاتحه", "البقرة", "آل عمران", "النساء", "المائدة", "الأنعام",
    "الأعراف", "الأنفال", "التوبة", "يونس", "هود", "يوسف", "الرعد",
    "إبراهيم", "الحجر", "النحل", "الإسراء", "الكهف", "مريم", "طه",
    "الأنبياء", "الحج", "المؤمنون", "النّور", "الفرقان", "الشعراء",
    "النّمل", "القصص", "العنكبوت", "الرّوم", "لقمان", "السجدة",
    "الأحزاب", "سبأ", "فاطر", "يس", "الصافات", "ص", "الزمر",
    "غافر", "فصّلت", "الشورى", "الزخرف", "الدّخان", "الجاثية",
    "الأحقاف", "محمد", "الفتح", "الحجرات", "ق", "الذاريات",
    "الطور", "النجم", "القمر", "الرحمن", "الواقعة", "الحديد",
    "المجادلة", "الحشر", "الممتحنة", "الصف", "الجمعة", "المنافقون",
    "التغابن", "الطلاق", "التحريم", "الملك", "القلم", "الحاقة",
    "المعارج", "نوح", "الجن", "المزّمّل", "المدّثر", "القيامة",
    "الإنسان", "المرسلات", "النبأ", "النازعات", "عبس", "التكوير",
    "الإنفطار", "المطفّفين", "الإنشقاق", "البروج", "الطارق",
    "الأعلى", "الغاشية", "الفجر", "البلد", "الشمس", "الليل",
    "الضحى", "الشرح", "التين", "العلق", "القدر", "البينة",
    "الزلزلة", "العاديات", "القارعة", "التكاثر", "العصر",
    "الهمزة", "الفيل", "قريش", "الماعون", "الكوثر", "الكافرون",
    "النصر", "المسد", "الإخلاص", "الفلق", "الناس"
  ];


  @override
  initState() {
    findChapters = chapterName;
    findAyatNumbers = ayatNumber;
    super.initState();
  }
  void filterChapters(String enteredKeyword) {
    List<String> results = [];
    List<String> ayatResults = [];
    if (enteredKeyword.isEmpty) {
      results = chapterName;
      ayatResults = ayatNumber;
    } else {
      for (int i = 0; i < chapterName.length; i++) {
        if (chapterName[i].contains(enteredKeyword)) {
          results.add(chapterName[i]);
          ayatResults.add(ayatNumber[i]);
        }
      }
    }
    setState(() {
      findChapters = results;
      findAyatNumbers = ayatResults;
    });
  }


  @override
  Widget build(BuildContext context) {





    return Column(
      children: [
        Image.asset("assets/images/quran_header_icn.png"),

        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: SizedBox(

            width: MediaQuery.of(context).size.width * 0.99,
            height: MediaQuery.of(context).size.height * 0.05,
            child: TextField(
              onChanged: (value) => filterChapters(value),
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: Colors.black,
              ),


              decoration: InputDecoration(
                focusedBorder:  OutlineInputBorder(

                  borderRadius: const  BorderRadius.all(Radius.circular(20)),

                  borderSide:  BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
                border:  OutlineInputBorder(

                  borderRadius: const  BorderRadius.all(Radius.circular(20)),

                  borderSide:  BorderSide(
                    color: Theme.of(context).colorScheme.secondary,
                    width: 2,
                  ),
                ),
                suffixIcon:  Icon(Icons.search, color: Theme.of(context).colorScheme.secondary,),

                hintText:
                AppLocalizations.of(context)?.search,
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                fillColor: const Color(0xffF8F8F8),

              ),
            ),
          ),
        ),

        Divider(
          thickness: 2,
          height: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "${AppLocalizations.of(context)?.ayatNumber}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),

            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              color: Theme.of(context).colorScheme.secondary,
              width: 2,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "${AppLocalizations.of(context)?.chapterTitle}",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
              ),
            ),

          ],
        ),
        Divider(
          thickness: 2,
          height: 2,
          color: Theme.of(context).colorScheme.secondary,
        ),
        Expanded(
          child: Stack(
            children: [
              // The vertical line inside the ListView
              Positioned.fill(
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 2, // Width of the vertical line
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
              ),
              // The ListView.builder
              ListView.builder(
                itemBuilder: (context, index) {
                  int originalIndex = chapterName.indexOf(findChapters[index]);
                  return ChapterTitle(findChapters[index],originalIndex,findAyatNumbers[index]);
                },
                itemCount: findChapters.length,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

