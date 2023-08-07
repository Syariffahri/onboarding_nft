import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/utils.dart';

Widget pageTemplate(
  BuildContext context, {
  required String title,
  required String description,
  required String image,
  double? imageHeight,
  bool isTransform = false,
}) {
  return Stack(
    children: [
      Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..scale(isTransform == false ? 1.0 : -1.0, 1.0),
        child: _stackImage(
          context,
          image: 'fade_bg02.png',
        ),
      ),
      _stackImage(
        context,
        image: 'blue_bg.png',
        height: MediaQuery.sizeOf(context).height * 0.6,
      ),
      _stackImage(context, image: 'stars02_background.png'),
      _stackImage(
        context,
        image: image,
        height: imageHeight ?? MediaQuery.sizeOf(context).height * 0.6,
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        margin: const EdgeInsets.only(top: 150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.inter(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: -2.5,
              ),
            ),
            const SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0.3),
                  ],
                  stops: const [0.1, 0.9],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ).createShader(bounds);
              },
              child: Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
            ),
          ],
        ),
      )
    ],
  );
}

Widget _stackImage(
  BuildContext context, {
  required String image,
  double? height,
}) {
  return Image.asset(
    '${Utils.imageAssets}$image',
    height: height ?? getHeight(context),
  );
}
