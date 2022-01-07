import 'dart:ui';

class Screen {
  static double physicalWidth = 0;
  static double physicalHeight = 0;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double statusHeight = 0;
  static double bottomHeight = 0;
  static double dpr = 1;
  static double rpx = 1;
  static double px = 1;

  static void initialize({double standardSize = 750}) {

    //1、手机的物理分辨率
    physicalWidth = window.physicalSize.width;
    physicalHeight = window.physicalSize.height;

    //2、获取dpr
    dpr = window.devicePixelRatio;

    //3、获取手机屏幕的大小（逻辑分辨率）
    screenWidth = physicalWidth/dpr;
    screenHeight = physicalHeight/dpr;

    //4、状态栏高度
    statusHeight = window.padding.top/dpr;
    bottomHeight = window.padding.bottom/dpr;

    //5、计算rpx的大小
    rpx = screenWidth/standardSize;

    px =  screenWidth / standardSize * 2;
  }

  static double setRpx(double size) {
    return rpx * size;
  }

  static double setPx(double size) {
    return px * size;
  }

}

extension DoubleExtension on double {
  double get rpx => Screen.rpx * this;
  double get px => Screen.px * this;
}

extension IntExtension on int {
  double get rpx => Screen.rpx * this;
  double get px => Screen.px * this;
}

