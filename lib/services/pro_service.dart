import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// PRO(유료) 상태 관리 (싱글톤)
/// - 현재는 목업: 실제 인앱결제(IAP) 연동 전이라 SharedPreferences에 저장
/// - 실결제 연동 시 in_app_purchase 패키지로 교체
class ProService {
  static final ProService _instance = ProService._internal();
  factory ProService() => _instance;
  ProService._internal();

  static const _key = 'is_pro_user';
  static const _keyDate = 'pro_purchased_at';

  final ValueNotifier<bool> isProNotifier = ValueNotifier(false);
  String? _purchasedAt;

  bool get isPro => isProNotifier.value;
  String? get purchasedAt => _purchasedAt;

  /// 무료로 보여주는 추천 순위 (1-based)
  static const int freeRankLimit = 5;

  bool _loaded = false;

  Future<void> ensureLoaded() async {
    if (_loaded) return;
    final prefs = await SharedPreferences.getInstance();
    isProNotifier.value = prefs.getBool(_key) ?? false;
    _purchasedAt = prefs.getString(_keyDate);
    _loaded = true;
  }

  /// 해당 순위가 무료인지 (PRO면 전부 무료)
  bool isRankFree(int rank) {
    if (isPro) return true;
    return rank <= freeRankLimit;
  }

  /// 목업 결제: 실제 IAP 연동 전까지 사용
  /// TODO: in_app_purchase 패키지 연동 시 이 메서드를 실제 결제로 교체
  Future<bool> purchasePro() async {
    // 실제로는 여기서 스토어 결제 UI 호출
    await Future.delayed(const Duration(seconds: 1));
    final prefs = await SharedPreferences.getInstance();
    final now = DateTime.now().toIso8601String();
    await prefs.setBool(_key, true);
    await prefs.setString(_keyDate, now);
    isProNotifier.value = true;
    _purchasedAt = now;
    return true;
  }

  /// PRO 복원 (재설치 등)
  Future<void> restorePro() async {
    _loaded = false;
    await ensureLoaded();
  }
}
