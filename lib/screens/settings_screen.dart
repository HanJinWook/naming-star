import 'package:flutter/material.dart';
import '../theme.dart';
import 'favorites_screen.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('설정')),
      body: ListView(
        padding: EdgeInsets.fromLTRB(
            20, 8, 20, 24 + MediaQuery.of(context).padding.bottom),
        children: [
          // 내 정보
          _sectionTitle('내 이름'),
          _menuTile(
            icon: Icons.bookmark_border,
            title: '보관함',
            subtitle: '저장한 이름 목록',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) =>
                      const FavoritesScreen()),
            ),
          ),
          const SizedBox(height: 16),

          // 앱 설정
          _sectionTitle('앱 설정'),
          _menuTile(
            icon: Icons.notifications_outlined,
            title: '알림 설정',
            subtitle: '추천·이벤트 알림 (준비 중)',
            onTap: () => _comingSoon('알림 설정'),
          ),
          _menuTile(
            icon: Icons.language_outlined,
            title: '언어',
            subtitle: '한국어',
            onTap: () => _comingSoon('언어 설정'),
          ),
          const SizedBox(height: 16),

          // 지원
          _sectionTitle('지원'),
          _menuTile(
            icon: Icons.help_outline,
            title: '자주 묻는 질문',
            onTap: () => _comingSoon('자주 묻는 질문'),
          ),
          _menuTile(
            icon: Icons.mail_outline,
            title: '문의하기',
            onTap: () => _comingSoon('문의하기'),
          ),
          _menuTile(
            icon: Icons.star_outline,
            title: '앱 평가하기',
            onTap: () => _comingSoon('앱 평가하기'),
          ),
          _menuTile(
            icon: Icons.share_outlined,
            title: '친구에게 공유하기',
            onTap: () => _comingSoon('공유하기'),
          ),
          const SizedBox(height: 16),

          // 정보
          _sectionTitle('정보'),
          _menuTile(
            icon: Icons.description_outlined,
            title: '이용약관',
            onTap: () => _comingSoon('이용약관'),
          ),
          _menuTile(
            icon: Icons.privacy_tip_outlined,
            title: '개인정보처리방침',
            onTap: () => _comingSoon('개인정보처리방침'),
          ),
          _menuTile(
            icon: Icons.info_outline,
            title: '앱 버전',
            subtitle: '1.0.0',
            onTap: null,
          ),
        ],
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w700,
          color: AppTheme.sub,
        ),
      ),
    );
  }

  Widget _menuTile({
    required IconData icon,
    required String title,
    String? subtitle,
    VoidCallback? onTap,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary),
        title: Text(title,
            style: const TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600)),
        subtitle: subtitle != null
            ? Text(subtitle,
                style: const TextStyle(fontSize: 12))
            : null,
        trailing: onTap != null
            ? const Icon(Icons.chevron_right,
                color: AppTheme.sub)
            : null,
        onTap: onTap,
      ),
    );
  }

  void _comingSoon(String feature) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$feature은(는) 준비 중이에요.')),
    );
  }
}

