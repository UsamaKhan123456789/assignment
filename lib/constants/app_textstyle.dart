
import 'package:flutter/material.dart';
import '../presentation/widgets/app_colors.dart';

class AppTextStyle {
  ///---------Font: Montserrat -------------------///
  static const pageTitleStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColor.black,
    fontFamily: AppFontFamilies.Baloo2,
  );

  static const buttonStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColor.white,
    fontFamily: 'Inter',
  );
  static const carouselText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: AppColor.white,
    fontFamily: 'Outfit',
  );
  static const carouselText2 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w700,
    color: AppColor.white,
    fontFamily: 'Outfit',
  );
  static const dropDownStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
    fontFamily: 'Outfit',
  );
  static const dontHaveAnAccount = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColor.dontHaveAnAccount,
    fontFamily: 'Inter',
  );
static const signUpText = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColor.signUpColor,
    fontFamily: 'Inter',
  );
static const headingText = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
    fontFamily: 'Outfit',
  );
static const discountText = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.discountCardColor,
    fontFamily: 'Outfit',
  );


  static const textButtonStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.primaryColor,
    fontFamily: 'Montserrat',
    decoration: TextDecoration.underline,
    decorationColor: AppColor.primaryColor
  );


  static const forgotPassword = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    color: AppColor.forgotColor
  );
  static const checkBoxText = TextStyle(
    fontFamily: "Inter",
    fontSize: 12,
    color: AppColor.hintColor
  );

  static const labelStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: const Color(0xff444444),
      fontFamily: AppFontFamilies.Baloo2
  );

  static const hintStyle = TextStyle(
    fontSize: 18,
    color: AppColor.hintColor,
      fontFamily: AppFontFamilies.Baloo2
  );

  static const tableStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    // color: AppColor.dateColor,
    fontFamily: AppFontFamilies.montserrat,
  );
  ///
  static const filedTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w400,
      color: const Color(0xff000000 ),
      fontFamily: AppFontFamilies.Baloo2
  );
  ///---------Font: SFProRounded -------------------///
  static const infoStyle = TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.w600,
    color:  AppColor.black,
    fontFamily: 'Inter'
  );

  static const errorStyle = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w500,
  color: AppColor.black,
  fontFamily: AppFontFamilies.sf_pro,
  );

  ///---------Font: Inter -------------------///
  static const disclaimerStyle = TextStyle(
    fontSize: 10.5,
    fontWeight: FontWeight.w400,
    color: AppColor.black,
    fontFamily: AppFontFamilies.Baloo2,
  );

  static const loadingStyle = TextStyle(
    fontSize: 18.5,
    fontWeight: FontWeight.w500,
    color: AppColor.black,
    letterSpacing: -0.37,
    fontFamily: AppFontFamilies.Baloo2,
  );
}


///-------------------App Font Families -------------------///
class AppFontFamilies
{
  static const String Baloo2 = 'Baloo2';
  static const String montserrat = 'Montserrat';
  static const String sf_pro = 'SFProRounded';
  static const String raleway = 'Raleway';
}
