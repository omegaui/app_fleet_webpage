import 'package:app_fleet_webpage/main.dart';
import 'package:flutter/material.dart';

enum ScreenType {
  mobile,
  tablet,
  desktop,
  monitor2k,
  monitor4k,
}

class AppTheme {
  static const textButtonBackground = Color(0xFF000000);
  static final textButtonStyle =
      fontBold.copyWith(fontSize: 20, color: Colors.white);

  static TextStyle get fontBold => const TextStyle(
        fontFamily: "Sen",
        fontWeight: FontWeight.bold,
      );

  static TextStyle get fontExtraBold => const TextStyle(
        fontFamily: "Sen",
        fontWeight: FontWeight.w900,
      );

  static TextStyle fontSize(size) => TextStyle(
        fontFamily: "Sen",
        fontSize: size,
      );

  static TextStyle fontSizeScaled(size) => TextStyle(
        fontFamily: "Sen",
        fontSize: getResponsiveSize(size),
      );

  static double getResponsiveSize(int size) {
    double responsiveScale = ResponsiveScale.getScale();
    double value = size * responsiveScale;
    return value;
  }
}

extension ConfigurableTextStyle on TextStyle {
  TextStyle withColor(Color color) {
    return copyWith(
      color: color,
    );
  }

  TextStyle makeMedium() {
    return copyWith(
      fontWeight: FontWeight.w500,
    );
  }

  TextStyle makeItalic() {
    return copyWith(
      fontStyle: FontStyle.italic,
    );
  }

  TextStyle makeBold() {
    return copyWith(
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle makeExtraBold() {
    return copyWith(
      fontWeight: FontWeight.w900,
    );
  }

  TextStyle fontSize(double size) {
    return copyWith(
      fontSize: size,
    );
  }
}

class ResponsiveScale {
  static const mobileRange = 450.0;
  static const tabletRange = 800.0;
  static const desktopRange = 1200.0;
  static const monitor2kRange = 1920.0;
  static const monitor4kRange = double.infinity;

  static const mobileScaleFactor = 0.4;
  static const tabletScaleFactor = 0.6;
  static const desktopScaleFactor = 1.0;
  static const monitor2kScaleFactor = 1.4;
  static const monitor4kScaleFactor = 1.6;

  static double getScale() {
    var context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint(
          "[WARNING] Cannot Determine the device size, Using desktopScaleFactor instead.");
      return desktopScaleFactor;
    }
    final size = MediaQuery.sizeOf(context).width;
    if (size <= mobileRange) {
      return mobileScaleFactor;
    } else if (size <= tabletRange) {
      return tabletScaleFactor;
    } else if (size <= desktopRange) {
      return desktopScaleFactor;
    } else if (size <= monitor2kRange) {
      return monitor2kScaleFactor;
    } else {
      return monitor4kScaleFactor;
    }
  }

  static ScreenType getScreenType() {
    var context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint(
          "[WARNING] Cannot Determine the screen type, Using desktop type instead.");
      return ScreenType.desktop;
    }
    final size = MediaQuery.sizeOf(context).width;
    if (size <= mobileRange) {
      return ScreenType.mobile;
    } else if (size <= tabletRange) {
      return ScreenType.tablet;
    } else if (size <= desktopRange) {
      return ScreenType.desktop;
    } else if (size <= monitor2kRange) {
      return ScreenType.monitor2k;
    } else {
      return ScreenType.monitor4k;
    }
  }

  static scale(int size) {
    return getScale() * size;
  }
}

class PageResizeObserver with WidgetsBindingObserver {
  VoidCallback onRebuildRequested;

  PageResizeObserver({required this.onRebuildRequested});

  @override
  void didChangeMetrics() {
    onRebuildRequested();
    super.didChangeMetrics();
  }
}
