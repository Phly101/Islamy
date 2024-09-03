import 'package:flutter/material.dart';
import 'package:islamy/UI/hadeth_details/hadeth_details.dart';
import 'package:islamy/UI/home/hadeth/hadeth_tab.dart';
class  HadethTitle extends StatelessWidget {
  Hadeth hadeth;

  HadethTitle (this.hadeth, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
        Navigator.pushNamed(context, HadethDetails.routeName, arguments: hadeth);
        },
        child: Text(
          "${hadeth.title} ",
          textDirection:  TextDirection.rtl,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ));
  }
}
