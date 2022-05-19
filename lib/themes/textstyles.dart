import 'package:flutter/material.dart';

import '../util/constants.dart';
import 'dimens.dart';

const kTextBold = TextStyle(
  fontFamily: kFontFamily,
  fontSize: fontSm,
  fontWeight: FontWeight.w600,
);

const kTextSemiBold = TextStyle(
  fontFamily: kFontFamily,
  fontSize: fontSm,
  fontWeight: FontWeight.w500,
);

const kTextMedium = TextStyle(
  fontFamily: kFontFamily,
  fontSize: fontSm,
  fontWeight: FontWeight.w400,
);

const kTextRegular = TextStyle(
  fontFamily: kFontFamily,
  fontSize: fontSm,
  fontWeight: FontWeight.w300,
);

const kTextThin = TextStyle(
  fontFamily: kFontFamily,
  fontSize: fontSm,
  fontWeight: FontWeight.w200,
);

class CustomText {
  static TextStyle bold({double? fontSize, Color? color}) {
    return kTextBold.copyWith(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle semiBold({double? fontSize, Color? color}) {
    return kTextSemiBold.copyWith(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle medium({double? fontSize, Color? color}) {
    return kTextMedium.copyWith(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle regular({double? fontSize, Color? color}) {
    return kTextRegular.copyWith(
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle thin({double? fontSize, Color? color}) {
    return kTextThin.copyWith(
      fontSize: fontSize,
      color: color,
    );
  }
}
