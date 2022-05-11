import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspirze_onboarding_app/ui/screens/animated_intro.dart';
import 'package:inspirze_onboarding_app/ui/screens/register_screen.dart';
import 'package:inspirze_onboarding_app/ui/screens/slides_screen.dart';
import 'package:inspirze_onboarding_app/ui/screens/welcome_screen.dart';
import 'package:inspirze_onboarding_app/ui/widgets/video_widget.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inspirze OnBoarding',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const CryptoTechSingleLogin(),
    );
  }
}
