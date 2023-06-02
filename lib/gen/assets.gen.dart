/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsCfgGen {
  const $AssetsCfgGen();

  /// File path: assets/cfg/app_config_dev.json
  String get appConfigDev => 'assets/cfg/app_config_dev.json';

  /// File path: assets/cfg/app_config_prod.json
  String get appConfigProd => 'assets/cfg/app_config_prod.json';

  /// File path: assets/cfg/app_config_staging.json
  String get appConfigStaging => 'assets/cfg/app_config_staging.json';

  /// List of all assets
  List<String> get values => [appConfigDev, appConfigProd, appConfigStaging];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  $AssetsImagesPngGen get png => const $AssetsImagesPngGen();
  $AssetsImagesSvgGen get svg => const $AssetsImagesSvgGen();
}

class $AssetsImagesPngGen {
  const $AssetsImagesPngGen();

  /// File path: assets/images/png/avatar.png
  AssetGenImage get avatar =>
      const AssetGenImage('assets/images/png/avatar.png');

  /// File path: assets/images/png/background.png
  AssetGenImage get background =>
      const AssetGenImage('assets/images/png/background.png');

  /// File path: assets/images/png/class_room.png
  AssetGenImage get classRoom =>
      const AssetGenImage('assets/images/png/class_room.png');

  /// File path: assets/images/png/clock.png
  AssetGenImage get clock => const AssetGenImage('assets/images/png/clock.png');

  /// File path: assets/images/png/exam.png
  AssetGenImage get exam => const AssetGenImage('assets/images/png/exam.png');

  /// File path: assets/images/png/invisible.png
  AssetGenImage get invisible =>
      const AssetGenImage('assets/images/png/invisible.png');

  /// File path: assets/images/png/logo.png
  AssetGenImage get logo => const AssetGenImage('assets/images/png/logo.png');

  /// File path: assets/images/png/reset_background.png
  AssetGenImage get resetBackground =>
      const AssetGenImage('assets/images/png/reset_background.png');

  /// File path: assets/images/png/team.png
  AssetGenImage get team => const AssetGenImage('assets/images/png/team.png');

  /// File path: assets/images/png/user.png
  AssetGenImage get user => const AssetGenImage('assets/images/png/user.png');

  /// File path: assets/images/png/visible.png
  AssetGenImage get visible =>
      const AssetGenImage('assets/images/png/visible.png');

  /// File path: assets/images/png/watch.png
  AssetGenImage get watch => const AssetGenImage('assets/images/png/watch.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        avatar,
        background,
        classRoom,
        clock,
        exam,
        invisible,
        logo,
        resetBackground,
        team,
        user,
        visible,
        watch
      ];
}

class $AssetsImagesSvgGen {
  const $AssetsImagesSvgGen();

  /// File path: assets/images/svg/ic_logo.svg
  SvgGenImage get icLogo => const SvgGenImage('assets/images/svg/ic_logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [icLogo];
}

class Assets {
  Assets._();

  static const $AssetsCfgGen cfg = $AssetsCfgGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

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
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
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

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      //colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
