import 'package:flutter/material.dart';
import 'package:login_assignment/application_ui/application_ui.dart';

class HomePageHelper {
  static DateTime? pickedDate;
  static DateTime selectedDate = DateTime.now();
  static int guestCounter = 0;

  static getTextField(context, recController, isHidden, labelMessage,
      prefixRecIcon, suffixRecIcon, keyboardType) {
    return Container(
      width: ApplicationUi.screenWidth,
      height: ApplicationUi.screenHeight * 0.05,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
            left: ApplicationUi.appBodyPadding,
            right: ApplicationUi.appBodyPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: ApplicationUi.screenWidth / 1.175,
              child: TextField(
                controller: recController,
                keyboardType: keyboardType,
                cursorColor: ApplicationUi.primaryColor,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                  fontSize: ApplicationUi.fontMedium,
                ),
                obscureText: isHidden,
                decoration: InputDecoration(
                  prefixIcon: Icon(prefixRecIcon),
                  suffixIcon: Icon(suffixRecIcon),
                  hintText: labelMessage,
                  alignLabelWithHint: true,
                  border: InputBorder.none,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static getCalendarField(context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: ApplicationUi.screenWidth,
          height: ApplicationUi.screenHeight * 0.05,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: ApplicationUi.appBodyPadding,
                right: ApplicationUi.appBodyPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () async {
                      pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.utc(2024, 12, 30),
                      );
                      if (pickedDate != null && pickedDate != selectedDate) {
                        setState(() {
                          selectedDate = pickedDate!;
                        });
                      }
                    },
                    icon: const Icon(Icons.date_range_outlined)),
                Text(
                  pickedDate == null ? "Pick a date" : "$pickedDate",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                    fontSize: ApplicationUi.fontMedium,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static getGuestField(context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          width: ApplicationUi.screenWidth,
          height: ApplicationUi.screenHeight * 0.05,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                left: ApplicationUi.appBodyPadding + 12,
                right: ApplicationUi.appBodyPadding),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.people_alt_outlined),
                ApplicationUi.getsmallHorizontalContentGap(),
                Expanded(
                  flex: 6,
                  child: Text(
                    "${guestCounter} Guests",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5,
                      fontSize: ApplicationUi.fontMedium,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      setState(() {
                        if (guestCounter != 0) {
                          guestCounter--;
                        }
                      });
                    });
                  },
                  child: Text(
                    "-",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: ApplicationUi.fontBig + 15,
                    ),
                  ),
                ),
                ApplicationUi.getsmallHorizontalContentGap(),
                ApplicationUi.getsmallHorizontalContentGap(),
                Container(
                  width: 1.0,
                  height: ApplicationUi.screenHeight * 0.03,
                  color: Colors.black,
                ),
                ApplicationUi.getsmallHorizontalContentGap(),
                ApplicationUi.getsmallHorizontalContentGap(),
                InkWell(
                  onTap: () {
                    setState(() {
                      guestCounter++;
                    });
                  },
                  child: Text(
                    "+",
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: ApplicationUi.fontBig + 15,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
