import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// AdMob 광고 관리
/// - 현재는 Google 공식 테스트 ID 사용 (실제 광고 아님)
/// - 실제 수익화: AdMob(admob.google.com)에서 앱 등록 후
///   아래 테스트 ID를 실제 광고 단위 ID로 교체
class AdService {
  // TODO: AdMob에서 발급받은 실제 ID로 교체
  static String get bannerAdUnitId {
    if (kDebugMode) {
      // 개발 중에는 항상 테스트 ID 사용
      return _testBannerId;
    }
    // 릴리즈용 실제 ID (AdMob에서 발급 후 입력)
    // return 'ca-app-pub-xxxxxxxxxxxxxxxx/yyyyyyyyyy';
    return _testBannerId;
  }

  static String get _testBannerId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    }
    return '';
  }

  static Future<void> init() async {
    await MobileAds.instance.initialize();
  }
}

/// 하단 배너 광고 위젯
class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;
  bool _loaded = false;

  @override
  void initState() {
    super.initState();
    _loadAd();
  }

  void _loadAd() {
    final adUnitId = AdService.bannerAdUnitId;
    if (adUnitId.isEmpty) return;
    _bannerAd = BannerAd(
      adUnitId: adUnitId,
      size: AdSize.banner,
      request: const AdRequest(),
      listener: BannerAdListener(
        onAdLoaded: (_) {
          if (mounted) setState(() => _loaded = true);
        },
        onAdFailedToLoad: (ad, err) {
          ad.dispose();
        },
      ),
    )..load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_loaded || _bannerAd == null) {
      return const SizedBox.shrink();
    }
    return Container(
      alignment: Alignment.center,
      width: _bannerAd!.size.width.toDouble(),
      height: _bannerAd!.size.height.toDouble(),
      child: AdWidget(ad: _bannerAd!),
    );
  }
}
