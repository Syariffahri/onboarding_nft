import 'package:flutter/material.dart';
import 'package:onboarding_nft/screens/onboarding.dart';

import 'app/theme/app_theme.dart';

/*

//-----Fahridrus.dev-----//

Github    : https://github.com/Syariffahri
Linkedin  : Syarif Muhammad Fahri
Instagram : @fahridrus.dev
Youtube   : Coding with Fahri


*/

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Onboarding NFT by Fahridrus.dev',
      home: const OnboardingScreen(),
      theme: AppTheme.myTheme,
    );
  }
}
