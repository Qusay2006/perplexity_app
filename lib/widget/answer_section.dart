import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:perplexity_app/core/injection/injection.dart';
import 'package:perplexity_app/data/chat_web_service.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AnswerSection extends StatefulWidget {
  const AnswerSection({super.key});

  @override
  State<AnswerSection> createState() => _AnswerSectionState();
}

class _AnswerSectionState extends State<AnswerSection> {
  bool isLoading= true;
  StreamSubscription? sub ;
  String fullResponse = """
  Loading the answer for your question. This text is only used to draw the skeleton
  Loading the answer for your question. This text is only used to draw the skeleton
  Loading the answer for your question. This text is only used to draw the skeleton
      """;


  @override
  void initState() {
    super.initState();
    sub = getIt<ChatWebService>().contentStream.listen((event) {
      setState(() {
        if(isLoading) {
          fullResponse = '';}
        fullResponse +=event['data'];
        isLoading = false;
      });
    },);
  }
  @override
  void dispose() {
sub?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start
            ,children: [
            Text("Answer",style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),),
              const SizedBox(height: 16,),
              MarkdownBody(data: fullResponse,
                shrinkWrap: true,),

            ],),
        ),
    );
  }
}
