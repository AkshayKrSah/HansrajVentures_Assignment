import 'package:flutter/material.dart';
import 'package:login_assignment/application_screens/screen_helper/homeHelper.dart';
import 'package:login_assignment/application_ui/application_ui.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ApplicationUi.pageBgColor,
        appBar: ApplicationUi.getAppBar(context),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: ApplicationUi.appBodyPadding,
                    right: ApplicationUi.appBodyPadding),
                child: Column(
                  children: [
                    ApplicationUi.getbigContentGap(),
                    HomePageHelper.getTextField(
                        context,
                        locationController,
                        false,
                        "Location",
                        Icons.search,
                        Icons.tune,
                        TextInputType.text),
                    ApplicationUi.getsmallContentGap(),
                    HomePageHelper.getCalendarField(context),
                    ApplicationUi.getsmallContentGap(),
                    HomePageHelper.getGuestField(context),
                    ApplicationUi.getsmallContentGap(),
                    ApplicationUi.getAppButton(context, () {}, "Search"),
                    ApplicationUi.getbigContentGap(),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                  color: ApplicationUi.blockColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              width: ApplicationUi.screenWidth,
              height: ApplicationUi.screenHeight / 1.8,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: ApplicationUi.appBodyPadding,
                    right: ApplicationUi.appBodyPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ApplicationUi.getsmallContentGap(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ApplicationUi.hatImgPath,
                          height: ApplicationUi.screenHeight / 3.5,
                          width: ApplicationUi.screenWidth / 1.1,
                        ),
                      ],
                    ),
                    Text("DETAILS",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: ApplicationUi.fontBig,
                        )),
                    ApplicationUi.getsmallContentGap(),
                    Text(
                        "Beyond stunning beaches and magical temples, Bali has virtually every kind of natural beauty. Glorious mountains",
                        style: TextStyle(
                          fontSize: ApplicationUi.fontMedium,
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
