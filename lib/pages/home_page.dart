import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:perplexity_app/core/injection/injection.dart';
import 'package:perplexity_app/data/chat_web_service.dart';
import 'package:perplexity_app/widget/search_bar.dart';
import '../widget/side_nav.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  final TextEditingController searchText=TextEditingController();

  @override
  void initState() {
    super.initState();
  getIt<ChatWebService>().connect();
  }
  @override
  void dispose() {
    super.dispose();
    searchText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          //side Nav
          const SideNav(),
          // search section
          const SearchBarr(),
            ],)
    );
  }
}
