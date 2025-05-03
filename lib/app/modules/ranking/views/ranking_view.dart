import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:muklog/app/modules/home/controllers/home_controller.dart';
import 'package:muklog/app/modules/profile/controllers/profile_controller.dart';

import '../../../models/user_ranking.dart';
import '../../../routes/app_pages.dart';
import '../controllers/ranking_controller.dart';

class RankingView extends GetView<RankingController> {
  const RankingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('랭킹'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.fetchRankings,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return RefreshIndicator(
          onRefresh: controller.fetchRankings,
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              buildSection('📊 전체 포인트 랭킹', controller.pointRanking),
              buildSection('🆙 최근 레벨업 랭킹', controller.levelUpRanking),
              buildSection('✏️ 출제왕 랭킹', controller.questionRanking),
              buildSection('🎯 정답률 랭킹', controller.accuracyRanking),
            ],
          ),
        );
      }),
    );
  }

  Widget buildSection(String title, List rankings) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (rankings.isEmpty)
          Center(
            child: Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  _getEmptyMessage(title),
                  style: const TextStyle(color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  onPressed: () {
                    Get.find<HomeController>().changeTab(0);
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('참여하러 가기'),
                ),
              ],
            ),
          )
        else
          ...rankings.asMap().entries.map((entry) {
            final index = entry.key + 1;
            final user = entry.value;
            final profile = Get.find<ProfileController>().user.value;
            bool isMe = user.uid == profile!.uid;
            return Container(
              decoration: BoxDecoration(
                color: isMe ? Colors.yellow[100] : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
                border:
                    isMe
                        ? Border.all(color: Colors.amber, width: 1.5)
                        : Border.all(color: Colors.transparent),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatarUrl),
                ),
                title: Text(
                  '${user.nickname} (Lv.${user.level} / ${user.title})',
                ),
                subtitle: Text(_getSubtitle(title, user)),
                trailing: Text('#$index'),
              ),
            );
          }),
      ],
    );
  }

  Widget buildMyRankTile(String title, List<UserRanking> rankings) {
    final myUid = Get.find<ProfileController>().user.value?.uid;
    final alreadyIncluded = rankings.any((r) => r.uid == myUid);

    if (alreadyIncluded) return const SizedBox(); // 중복 방지

    final myRank = controller.myPointRank.value;
    if (myRank == null) return const SizedBox();

    final profile = Get.find<ProfileController>().user.value;

    return profile == null
        ? SizedBox()
        : Container(
          decoration: BoxDecoration(
            color: Colors.yellow[100],
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.amber, width: 1.5),
          ),
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(profile.avatarUrl),
            ),
            title: Text(
              '${profile.nickname} (Lv.${profile.level} / ${profile.title})',
            ),
            subtitle: Text(_getSubtitle(title, profile)),
            trailing: Text('#${myRank['rank']}'),
          ),
        );
  }

  String _getEmptyMessage(String title) {
    switch (title) {
      case '📊 전체 포인트 랭킹':
        return '아직 포인트를 모은 사람이 없어요!\n첫 번째 주인공이 되어보세요 🎯';
      case '🆙 최근 레벨업 랭킹':
        return '레벨업한 유저가 아직 없어요!\n지금 도전해서 다크호스가 되어보세요 🦄';
      case '✏️ 출제왕 랭킹':
        return '첫 퀴즈 출제자가 되어보세요 ✏️\n모두가 기다리고 있어요!';
      case '🎯 정답률 랭킹':
        return '정답률이 높은 사람이 아직 없어요!\n정확한 감각을 자랑해보세요 💡';
      default:
        return '랭킹 정보가 없습니다.';
    }
  }

  String _getSubtitle(String type, dynamic user) {
    switch (type) {
      case '📊 전체 포인트 랭킹':
        return '${user.point}점';
      case '🆙 최근 레벨업 랭킹':
        return '최근 레벨업';
      case '✏️ 출제왕 랭킹':
        return '${user.questionCount}문제 출제';
      case '🎯 정답률 랭킹':
        return '${user.correctRate}% (${user.playCount}회 풀이)';
      default:
        return '';
    }
  }
}
