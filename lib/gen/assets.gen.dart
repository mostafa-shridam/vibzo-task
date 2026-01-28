// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/logo.png');

  /// Directory path: assets/images/splash
  $AssetsImagesSplashGen get splash => const $AssetsImagesSplashGen();

  /// Directory path: assets/images/svgs
  $AssetsImagesSvgsGen get svgs => const $AssetsImagesSvgsGen();

  /// List of all assets
  List<AssetGenImage> get values => [logo];
}

class $AssetsImagesSplashGen {
  const $AssetsImagesSplashGen();

  /// File path: assets/images/splash/Logo.svg
  String get logo => 'assets/images/splash/Logo.svg';

  /// File path: assets/images/splash/Overlay.png
  AssetGenImage get overlay =>
      const AssetGenImage('assets/images/splash/Overlay.png');

  /// File path: assets/images/splash/first_bottom_left.jpg
  AssetGenImage get firstBottomLeft =>
      const AssetGenImage('assets/images/splash/first_bottom_left.jpg');

  /// File path: assets/images/splash/first_bottom_right.jpg
  AssetGenImage get firstBottomRight =>
      const AssetGenImage('assets/images/splash/first_bottom_right.jpg');

  /// File path: assets/images/splash/first_center_left.jpg
  AssetGenImage get firstCenterLeft =>
      const AssetGenImage('assets/images/splash/first_center_left.jpg');

  /// File path: assets/images/splash/first_center_right.jpg
  AssetGenImage get firstCenterRight =>
      const AssetGenImage('assets/images/splash/first_center_right.jpg');

  /// File path: assets/images/splash/first_top.jpg
  AssetGenImage get firstTop =>
      const AssetGenImage('assets/images/splash/first_top.jpg');

  /// File path: assets/images/splash/sec_bottom_left.jpg
  AssetGenImage get secBottomLeft =>
      const AssetGenImage('assets/images/splash/sec_bottom_left.jpg');

  /// File path: assets/images/splash/sec_bottom_right.jpg
  AssetGenImage get secBottomRight =>
      const AssetGenImage('assets/images/splash/sec_bottom_right.jpg');

  /// File path: assets/images/splash/sec_center_left.jpg
  AssetGenImage get secCenterLeft =>
      const AssetGenImage('assets/images/splash/sec_center_left.jpg');

  /// File path: assets/images/splash/sec_center_right.jpg
  AssetGenImage get secCenterRight =>
      const AssetGenImage('assets/images/splash/sec_center_right.jpg');

  /// File path: assets/images/splash/sec_top.jpg
  AssetGenImage get secTop =>
      const AssetGenImage('assets/images/splash/sec_top.jpg');

  /// List of all assets
  List<dynamic> get values => [
    logo,
    overlay,
    firstBottomLeft,
    firstBottomRight,
    firstCenterLeft,
    firstCenterRight,
    firstTop,
    secBottomLeft,
    secBottomRight,
    secCenterLeft,
    secCenterRight,
    secTop,
  ];
}

class $AssetsImagesSvgsGen {
  const $AssetsImagesSvgsGen();

  /// File path: assets/images/svgs/Country Flags.svg
  String get countryFlags => 'assets/images/svgs/Country Flags.svg';

  /// File path: assets/images/svgs/Facebook.svg
  String get facebook => 'assets/images/svgs/Facebook.svg';

  /// File path: assets/images/svgs/Feedback Icon.svg
  String get feedbackIcon => 'assets/images/svgs/Feedback Icon.svg';

  /// File path: assets/images/svgs/apple.svg
  String get apple => 'assets/images/svgs/apple.svg';

  /// File path: assets/images/svgs/edit-02.svg
  String get edit02 => 'assets/images/svgs/edit-02.svg';

  /// File path: assets/images/svgs/female-symbol.svg
  String get femaleSymbol => 'assets/images/svgs/female-symbol.svg';

  /// File path: assets/images/svgs/google.svg
  String get google => 'assets/images/svgs/google.svg';

  /// File path: assets/images/svgs/login_arrow.svg
  String get loginArrow => 'assets/images/svgs/login_arrow.svg';

  /// File path: assets/images/svgs/male-symbol.svg
  String get maleSymbol => 'assets/images/svgs/male-symbol.svg';

  /// File path: assets/images/svgs/smart-phone.svg
  String get smartPhone => 'assets/images/svgs/smart-phone.svg';

  /// File path: assets/images/svgs/snapchat.svg
  String get snapchat => 'assets/images/svgs/snapchat.svg';

  /// List of all assets
  List<String> get values => [
    countryFlags,
    facebook,
    feedbackIcon,
    apple,
    edit02,
    femaleSymbol,
    google,
    loginArrow,
    maleSymbol,
    smartPhone,
    snapchat,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
