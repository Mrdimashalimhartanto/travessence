import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:travessence/utils/size_config.dart';
import 'package:travessence/utils/theme.dart';

class MyTextStyle {
  static TextStyle primary20600 = GoogleFonts.poppins(
    fontSize: getScreenWidth(12.0),
    fontWeight: FontWeight.w600,
    color: MyColor.blacktravessence,
  );
  static TextStyle primaryPromo = GoogleFonts.poppins(
    fontSize: getScreenWidth(10.0),
    fontWeight: FontWeight.w600,
    color: MyColor.greytravessence,
  );

  static TextStyle primaryMenu = GoogleFonts.poppins(
    fontSize: getScreenWidth(10.0),
    fontWeight: FontWeight.w600,
    color: MyColor.greytravessence,
  );

  static TextStyle primary18600 = GoogleFonts.poppins(
    fontSize: getScreenWidth(18.0),
    fontWeight: FontWeight.w600,
    color: MyColor.travessence,
  );
  static TextStyle primary16600 = GoogleFonts.poppins(
    fontSize: getScreenWidth(12.0),
    fontWeight: FontWeight.w600,
    color: MyColor.greentravessence,
  );
  static TextStyle white8400card = GoogleFonts.poppins(
    fontSize: getScreenWidth(16.0),
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
}
