abstract class DurationValues {
  static const fast = Duration(milliseconds: 100);
  static const quick = Duration(milliseconds: 175);
  static const haste = Duration(milliseconds: 200);
  static const normal = Duration(milliseconds: 250);
  static const medium = Duration(milliseconds: 350);
  static const slow = Duration(milliseconds: 400);

  static const naturalDelay = Duration(milliseconds: 500);
  static const onTapDelay = Duration(milliseconds: 175);

  static const carouselInterval = Duration(seconds: 3);
  static const carouselTransition = Duration(milliseconds: 800);

  static const insetDuration = Duration(milliseconds: 200);

  static const topSnackbarDuration = Duration(seconds: 8);
  static const adsDelayDuration = Duration(seconds: 10);
  static const adsTransitionDuration = Duration(seconds: 2);
  static const pendingPansDaysRange = Duration(days: 8);
}
