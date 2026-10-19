import 'package:flutter/material.dart';
import '../data/rankings.dart';
import '../theme.dart';

/// 아기 이름 랭킹
class RankingScreen extends StatefulWidget {
  const RankingScreen({super.key});

  @override
  State<RankingScreen> createState() => _RankingScreenState();
}

class _RankingScreenState extends State<RankingScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tab;

  @override
  void initState() {
    super.initState();
    _tab = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tab.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아기 이름 랭킹'),
        bottom: TabBar(
          controller: _tab,
          labelColor: AppTheme.primary,
          unselectedLabelColor: AppTheme.sub,
          indicatorColor: AppTheme.primary,
          tabs: const [
            Tab(text: '남아 TOP 20'),
            Tab(text: '여아 TOP 20'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tab,
        children: const [
          _RankList(entries: boyRanking2024, isBoy: true),
          _RankList(entries: girlRanking2024, isBoy: false),
        ],
      ),
    );
  }
}

class _RankList extends StatelessWidget {
  final List<RankEntry> entries;
  final bool isBoy;
  const _RankList({required this.entries, required this.isBoy});

  @override
  Widget build(BuildContext context) {
    final maxCount =
        entries.map((e) => e.count).reduce((a, b) => a > b ? a : b);
    return ListView(
      padding: EdgeInsets.fromLTRB(
          20, 20, 20, 20 + MediaQuery.of(context).padding.bottom),
      children: [
        // 트렌드 카드
        Card(
          color: isBoy ? AppTheme.boy : AppTheme.girl,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.trending_up,
                        color: Colors.white, size: 20),
                    SizedBox(width: 6),
                    Text('2025 최근 트렌드',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
                            color: Colors.white)),
                  ],
                ),
                SizedBox(height: 8),
                Text(trend2025,
                    style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        height: 1.6)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 12),
        ...entries.map((e) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 7),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Text('${e.rank}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: e.rank <= 3
                              ? AppTheme.gold
                              : AppTheme.sub)),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(e.name,
                              style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700)),
                          const SizedBox(width: 8),
                          Text('${e.count}명',
                              style: const TextStyle(
                                  fontSize: 12,
                                  color: AppTheme.sub)),
                        ],
                      ),
                      const SizedBox(height: 5),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: e.count / maxCount,
                          minHeight: 6,
                          backgroundColor: AppTheme.line,
                          valueColor: AlwaysStoppedAnimation(
                              isBoy ? AppTheme.boy : AppTheme.girl),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppTheme.primarySoft,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.info_outline,
                      size: 16, color: AppTheme.primary),
                  SizedBox(width: 6),
                  Text('랭킹 읽는 법',
                      style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: AppTheme.primary)),
                ],
              ),
              SizedBox(height: 6),
              Text(
                '· 출처: $rankingSource\n'
                '· TOP 20에 든 이름은 또래에 같은 이름이 많을 수 있어요. '
                '작명별 추천에서는 이런 이름에 사용성 점수 조정이 들어갑니다.',
                style: TextStyle(fontSize: 12, color: AppTheme.sub, height: 1.6),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
