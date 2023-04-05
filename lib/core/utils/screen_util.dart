import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomScreenUtil {
  static initMobileDesignSize({required BuildContext context}) {
    ScreenUtil.init(context,
        designSize: Size(412, 870),);
  }

  static initTabletDesignSize({required BuildContext context}) {
    ScreenUtil.init(context,
        designSize: Size(600, 1023));
  }
  static initWebDesignSize({required BuildContext context}) {
    ScreenUtil.init(context,
        designSize: Size(1366, 767));
  }
}
