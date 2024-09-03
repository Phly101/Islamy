import 'package:flutter/material.dart';
import 'package:islamy/UI/home/hadeth/hadeth_tab.dart';
import 'package:islamy/default_screen.dart';
class HadethDetails extends StatefulWidget {
  static const String routeName = 'hadeth_details';

  const HadethDetails( {super.key});

  @override
  State<HadethDetails> createState() => _HadethDetailsState();
}

class _HadethDetailsState extends State<HadethDetails> {

  @override
  Widget build(BuildContext context) {
    Hadeth hadeth = ModalRoute.of(context)?.settings.arguments as Hadeth;

    return DefaultScreen(
      body: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),

        ),
        body: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            elevation: 24,
            margin: const EdgeInsets.symmetric(vertical: 64, horizontal: 24),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Text(hadeth.title,
                      style: Theme.of(context).textTheme.titleMedium
                      ,textAlign: TextAlign.center,
                      ),


                    ),
                  ),

                Divider(height: 2,thickness: 1,color: Theme.of(context).colorScheme.secondary,),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Text(hadeth.content,
                      style: const TextStyle(
                        fontSize: 20,

                      ),
                        textAlign: TextAlign.center,

                      ),
                    ),
                  ),
                ),
              ],
            )




        ),
      ),
    );
  }


}
