import 'package:flutter/material.dart';
import 'package:travessence/utils/mytextstyle.dart';
import 'package:travessence/utils/size_config.dart';

Widget menuContainer(BuildContext context, String iconData, String titleTxt) {
  return Column(
    children: [
      Image.asset(iconData),
      SizedBox(height: getScreenHeight(10.0)),
      Text(titleTxt, style: MyTextStyle.primary16600),
    ],
  );
}

Widget menuContainerTravessence(
  BuildContext context,
  String iconData,
  String titleTxt,
  void Function() func,
) {
  return OutlinedButton(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.only(top: 10.0),
      side: BorderSide.none,
    ),
    onPressed: func,
    child: Column(
      children: [
        Image.asset(iconData, width: 40),
        SizedBox(height: getScreenHeight(10.0)),
        Text(
          titleTxt,
          style: MyTextStyle.primaryMenu,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
