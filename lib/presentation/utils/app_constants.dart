abstract class AppConstants {
  static const double none = 0;
  static const double extraSmall = 2;
  static const double small = 4;
  static const double medium = 8;
  static const double large = 16;
  static const double extraLarge = 32;

  static const double circle = 100;

  static const double _bubblePlacementConstant = 1.3801;

  static double bubblePosition(double scrollOffset) =>
      scrollOffset.isNegative ? 0 : scrollOffset / _bubblePlacementConstant;

  static const double leadingWidth = 80;

  static const double expandedHeight = 200;
  static const double offsetToExpand = -300;

  static const double shimmerImageSize = 100;

  static const double fontNormal = 14;
  static const double fontLarge = 18;
  static const double fontExtraLarge = 24;

  static const String url = 'https://w0.peakpx.com/wallpaper/461/480/HD-wallpaper-chairs-furniture-interior.jpg';
}
