import 'package:flutter/material.dart';
import 'package:islamy/UI/chapter_details/chapter_details.dart';

class ChapterTitle extends StatelessWidget {
  String title;
  int index;
  String ayatNumber;

  ChapterTitle(this.title, this.index,this.ayatNumber);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.pushNamed(context, ChapterDetails.routeName,
              arguments: ChapterDetailsArgs(
                chapterIndex: index,
                chapterTitle: title,
              ));
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Text(
                  ayatNumber,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ));
  }
}
