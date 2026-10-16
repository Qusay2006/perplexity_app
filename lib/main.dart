import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:perplexity_app/core/injection/injection.dart';
import 'package:perplexity_app/core/theme/pallet.dart';
import 'package:perplexity_app/data/chat_web_service.dart';
import 'package:perplexity_app/pages/home_page.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await DI();
  getIt<ChatWebService>().connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,theme: ThemeData(
        scaffoldBackgroundColor: Pallet.background,
    textTheme: GoogleFonts.interTextTheme(
      ThemeData.dark().textTheme
    )),
      home: const HomePage(),
    );}
}
