import 'package:flutter/material.dart';
import 'package:perplexity_app/core/theme/pallet.dart';
import 'package:perplexity_app/data/chat_web_service.dart';
import 'package:perplexity_app/pages/chat_page.dart';
import 'package:perplexity_app/widget/search_bar_button.dart';

import '../core/injection/injection.dart';

class SearchBarr extends StatefulWidget {

  const SearchBarr({super.key});

  @override
  State<SearchBarr> createState() => _SearchBarrState();
}
class _SearchBarrState extends State<SearchBarr> {
   TextEditingController searchText = TextEditingController();
@override
  void dispose() {
    super.dispose();
    searchText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(mainAxisAlignment: MainAxisAlignment.center
          , children: [
            const Text('data', style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w400,
                letterSpacing: 0.5
            ),),
            const SizedBox(height: 17,),
      
            Container(margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border.all(color: Pallet.searchBarBorder),
                borderRadius: BorderRadius.circular(20),
                color: Pallet.cardColor,
              ),
              width: 300,
              height: 100,
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      TextField(controller: searchText,
                        decoration: InputDecoration(
                            hintText: 'Search anything...',
                            hintStyle: TextStyle(
                                color: Pallet.textGrey,
                                fontSize: 16),
                            border: InputBorder.none
                        ),
                      textInputAction: TextInputAction.send,
                      onSubmitted: (value) {
                        if(searchText.text.isNotEmpty){
                          getIt<ChatWebService>().chat(searchText.text);
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) =>
                                ChatPage(question: searchText.text
                                    .trim()),));
                        }
                      },),
      
                      Row(
                          children: [
                            SearchBarButton(iconData: Icons.auto_awesome_outlined,text: 'Focus',),
                            const SizedBox(width: 20,),
                            SearchBarButton(iconData: Icons.circle_outlined,text: 'Attach',),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                if(searchText.text.isNotEmpty) {
                                  getIt<ChatWebService>().chat(searchText.text);
                                  Navigator.push(context, MaterialPageRoute(
                                    builder: (context) =>
                                        ChatPage(question: searchText.text
                                            .trim()),));
                                }
                              },
                              child: Container(
                                padding: EdgeInsetsGeometry.all(9),
                                decoration: BoxDecoration(
                                    color: Pallet.submitButton,
                                  borderRadius: BorderRadius.circular(40)
                                ),
                              child: Icon(Icons.arrow_forward,color: Pallet.background,
                              size: 16,),),
                            )
                          ]),
                    ],
                  )
      
              ),
            ),
          ]),
    );
  }
}

