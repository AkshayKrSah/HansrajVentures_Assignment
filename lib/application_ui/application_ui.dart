import 'package:flutter/material.dart';
import 'package:login_assignment/application_session/application_session.dart';

class ApplicationUi {
  static const primaryColor = Color(0xff18c0c1);
  static const pageBgColor = Color(0xffF2F5FA);
  static const blockColor = Color(0xffd3dae8);
  static const staticViewPort =
      308898; // calculated from Pixel 3 XL (393 x 786)
  static var screenWidth;
  static var screenHeight;
  static const profileImgPath = "assets/images/profile.png";
  static const hatImgPath = "assets/images/hat.png";

  static double fontBig = 20.0;
  static double fontMedium = 17.0;
  static double fontSmall = 14.0;
  static const smallContentGapSize = 10.0;
  static const bigContentGapSize = 35.0;
  static const appBodyPadding = 15.0;

  static getDynamicFont(context, viewPort, double fontSize) {
    if (viewPort > staticViewPort) {
      return fontSize;
    } else {
      return fontSize - 2;
    }
  }

  static getAppButton(context, onClickFunc, btnData) {
    return ElevatedButton(
        style: const ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(primaryColor)),
        onPressed: onClickFunc,
        child: Text(
          btnData,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
            fontSize:
                getDynamicFont(context, screenWidth * screenHeight, fontMedium),
          ),
        ));
  }

  static getAppBar(context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(screenWidth * 0.2),
      child: Padding(
        padding: const EdgeInsets.only(
            left: appBodyPadding,
            right: appBodyPadding,
            top: appBodyPadding - 5),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.06,
                backgroundImage: const AssetImage(profileImgPath),
              ),
              Text(
                "Hello, ${ApplicationSession.userName}!",
                style: TextStyle(
                  fontSize: getDynamicFont(
                      context, screenWidth * screenHeight, fontBig),
                  fontWeight: FontWeight.bold,
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Stack(children: [
                  const Icon(Icons.notifications_outlined),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, top: 2),
                    child: Container(
                      width: 9,
                      height: 9,
                      decoration: const BoxDecoration(
                          color: primaryColor, shape: BoxShape.circle),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  static getsmallContentGap() {
    return const SizedBox(
      height: smallContentGapSize,
    );
  }

  static getbigContentGap() {
    return const SizedBox(
      height: bigContentGapSize,
    );
  }

  static getsmallHorizontalContentGap() {
    return const SizedBox(
      width: smallContentGapSize,
    );
  }
}
