import 'package:flutter/material.dart';
import 'package:perplexity_app/core/injection/injection.dart';
import 'package:perplexity_app/core/theme/pallet.dart';
import 'package:perplexity_app/data/chat_web_service.dart';
import 'package:perplexity_app/widget/side_nav.dart';
import 'package:perplexity_app/widget/sources_section.dart';

import '../widget/answer_section.dart';

class ChatPage extends StatelessWidget {
  final String question;

  const ChatPage({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    TextEditingController questionMore = TextEditingController();
    return Scaffold(
      body: Row(children: [
        const SideNav(),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: SingleChildScrollView(
              child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(question, style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold
                  ),),
                  const SizedBox(height: 24,),
                  //sources
                  const SourcesSection(),
                  const SizedBox(height: 24),
                  //answer
                  const AnswerSection(),

                  Column(
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 10)
                          , width: 330,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Pallet.cardColor,
                              border: Border.all(
                                  color: Colors.teal,
                                  width: 0.2)
                          ),
                          child: Column(crossAxisAlignment: CrossAxisAlignment
                              .end,
                            children: [
                              TextField(controller: questionMore, decoration:
                              InputDecoration(
                                  border: InputBorder.none,
                                  hint: Text('Ask more...', style: TextStyle(
                                      color: Colors.grey.shade700),)),
                                textInputAction: TextInputAction.send,
                                onSubmitted: (value) {
                                  if (questionMore.text.isNotEmpty) {
                                    getIt<ChatWebService>().chat(
                                        questionMore.text.trim());
                                    questionMore.clear();
                                  }
                                },),
                              GestureDetector(
                                onTap: () {
                                  if (questionMore.text.isNotEmpty) {
                                    getIt<ChatWebService>().chat(
                                        questionMore.text.trim());
                                    questionMore.clear();
                                  }
                                },
                                child: Icon(Icons.keyboard_double_arrow_right,
                                  color: Colors.teal, size: 27,),
                              )
                            ],
                          )
                      ),
                    ],
                  )
                ],),
            ),
          ),
        ),
        Placeholder(fallbackWidth: 180, color: Colors.transparent,)
      ],),
    );
  }
}
