import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/UI/chapter_details/verse_content.dart';
import 'package:islamy/default_screen.dart';
class ChapterDetails extends StatefulWidget {
  static const String routeName = 'chapter_details';
  const ChapterDetails({super.key});

  @override
  State<ChapterDetails> createState() => _ChapterDetailsState();
}

class _ChapterDetailsState extends State<ChapterDetails> {
  List<String> verses =[];

  @override
  Widget build(BuildContext context) {

    var args = ModalRoute.of(context)?.settings.arguments as ChapterDetailsArgs;
   verses.isEmpty ? readFileData(args.chapterIndex) : null;
    return DefaultScreen(
      body: Scaffold(
        appBar: AppBar(
          title: Text(args.chapterTitle),

        ),
        body: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          elevation: 24,
          margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
          child:Column(
            children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(args.chapterTitle,
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.04,),
              Image.asset("assets/icons/1x/star_icon.png", width:25 ,height: 25, color: Theme.of(context).colorScheme.secondary,),
            ],
          ),
          Divider(height: 2,thickness: 1,color: Theme.of(context).colorScheme.secondary,),

          verses.isNotEmpty ?
          Expanded(
            child: ListView.separated(itemBuilder: (context, index) {
             return  VerseContent(verses[index],index );
            
            },
              separatorBuilder: (context, index) =>
              Container(height: 1,width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 64),
              ),
              itemCount: verses.length,),
          ):

              const Center(child: CircularProgressIndicator()),
          ],
        ),
      ),
    )
    );
  }

  void readFileData(int fileIndex)async{
   String fileContent= await rootBundle.loadString("assets/text/surah/${fileIndex+1}.txt");
   List<String> lines = fileContent.trim().split("\n");
   setState(() {
   verses = lines;
   });
  }
}
class ChapterDetailsArgs{
  int chapterIndex;
  String chapterTitle;
  ChapterDetailsArgs({required this.chapterIndex,required this.chapterTitle,});
}