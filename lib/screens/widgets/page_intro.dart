import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:onboarding_nft/utils/utils.dart';

Widget pageIntro(BuildContext context,
    {required double starsWidth, required double starsHeight}) {
  return Stack(
    children: [
      _stackImage(context, image: 'fade_bg01.png'),
      Opacity(
        opacity: 0.15,
        child: Image.asset(
          '${Utils.imageAssets}circle_background.png',
          color: Colors.blue,
          height: getHeight(context),
        ),
      ),
      AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: _stackImage(
          context,
          image: 'stars01_background.png',
          width: starsWidth,
          height: starsHeight,
        ),
      ),
      _stackImage(context, image: 'stars02_background.png'),
      Center(
        child: Image.asset(
          '${Utils.imageAssets}logo.png',
          width: getWidth(context) / 2,
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child: Container(
          margin: const EdgeInsets.only(top: 70),
          child: ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(0.2),
                ],
                stops: const [0.3, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ).createShader(bounds);
            },
            child: Text(
              'Welcome',
              style: GoogleFonts.inter(
                fontSize: 38,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: -2.5,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget _stackImage(
  BuildContext context, {
  required String image,
  double? width,
  double? height,
}) {
  return Image.asset(
    '${Utils.imageAssets}$image',
    width: width ?? MediaQuery.sizeOf(context).width,
    height: height ?? getHeight(context),
  );
}
