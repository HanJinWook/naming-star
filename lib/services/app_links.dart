import 'package:flutter/services.dart';

/// 안드로이드 네이티브 인텐트로 외부 연결을 여는 얇은 래퍼.
/// (url_launcher/share_plus 없이 동작하도록 MainActivity의
/// MethodChannel "jakmyeongbyeol/app_links"와 짝을 이룸)
class AppLinks {
  static const _channel = MethodChannel('jakmyeongbyeol/app_links');

  static const privacyPolicyUrl =
      'https://busstop22106.github.io/naming-star/privacy.html';
  static const contactEmail = 'busstop22106@gmail.com';
  static const packageName = 'com.jakmyeongbyeol.app';
  static const playStoreUrl =
      'https://play.google.com/store/apps/details?id=$packageName';

  /// 외부 브라우저/앱으로 URL 열기. 실패하면 false.
  static Future<bool> openUrl(String url) async {
    try {
      await _channel.invokeMethod('openUrl', {'url': url});
      return true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// 메일 앱으로 문의 메일 작성 화면 열기. 실패하면 false.
  static Future<bool> sendEmail({String subject = ''}) async {
    try {
      await _channel.invokeMethod(
          'sendEmail', {'email': contactEmail, 'subject': subject});
      return true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }

  /// 시스템 공유 시트로 텍스트 공유하기. 실패하면 false.
  static Future<bool> shareText(String text) async {
    try {
      await _channel.invokeMethod('shareText', {'text': text});
      return true;
    } on PlatformException {
      return false;
    } on MissingPluginException {
      return false;
    }
  }
}
