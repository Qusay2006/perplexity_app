import 'dart:async';
import 'package:flutter/material.dart';
import 'package:perplexity_app/core/injection/injection.dart';
import 'package:perplexity_app/core/theme/pallet.dart';
import 'package:perplexity_app/data/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SourcesSection extends StatefulWidget {
  const SourcesSection({super.key});

  @override
  State<SourcesSection> createState() => _SourcesSectionState();
}
class _SourcesSectionState extends State<SourcesSection> {
  bool isLoading = true;
  StreamSubscription? sub ;
 List searchResult = [
   {
     "title":"Mock Title Qusai is the goat ",
     "url":"https/www.youtube.com"
   },
   {
     "title":"Mock Title Qusai is the goat ",
     "url":"https/www.youtube.com"
   },
   {
     "title":"Mock Title Qusai is the goat ",
     "url":"https/www.youtube.com"
   }
 ];
  @override
  void initState() {
    super.initState();
    sub = getIt<ChatWebService>().searchResultStream.listen((event) {
      setState(() {
        if(isLoading) {
          searchResult.clear();
        }
        searchResult+=event['data'];
        isLoading = false;
      });
    },);
  }

  @override
  void dispose() {
    super.dispose();
  sub?.cancel();
  }


  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start
        ,children: [
        Row(children: [
          Icon(Icons.source_outlined,color: Colors.teal.shade500,)
          ,const SizedBox(width: 5,)  ,
          Text('Source',style: TextStyle(fontSize: 18,
          fontWeight: FontWeight.bold),)
        ],)
          ,const SizedBox(height: 16,)  ,
      Wrap(spacing:15,runSpacing: 15
        ,children:
      searchResult.map((e) {
        return Container(padding: EdgeInsetsGeometry.all(6),
          width: 110,
          decoration: BoxDecoration(color:
          Pallet.cardColor,
          border: BoxBorder.all(width: 0.2,color: Colors.teal),
          borderRadius: BorderRadius.circular(17)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
            Text(e['title'],style:
              TextStyle(
              fontWeight: FontWeight.w500,),
              maxLines: 3,
            overflow: TextOverflow.ellipsis),

            const SizedBox(height: 8,),

            Text(e['url'],style: TextStyle(color: Colors.grey),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            )
          ],),
        );
      },).toList()
      )


      ],),
    );
  }
}
