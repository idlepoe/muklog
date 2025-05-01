import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../models/generated_question.dart';
import '../../../routes/app_pages.dart';
import '../controllers/daily_question_controller.dart';

class DailyQuestionView extends GetView<DailyQuestionController> {
  const DailyQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: InkWell(onTap: () {
        controller.fetchQuestions();
      },child: const Text('오늘의 진품먹품'))),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            if (controller.randomQuestion.value != null)
              buildSection("🎯 오늘의 추천 문제", controller.randomQuestion.value!),
            if (controller.friendQuestion.value != null)
              buildSection("👥 친구가 낸 문제", controller.friendQuestion.value!),
            if (controller.popularQuestion.value != null)
              buildSection("🔥 인기 문제", controller.popularQuestion.value!),
          ],
        );
      }),
    );
  }

  Widget buildSection(String title, GeneratedQuestion q) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: ListTile(
        leading: Image.network(q.imageUrl, width: 60, fit: BoxFit.cover),
        title: Text(title),
        subtitle: Text(q.question),
        trailing: ElevatedButton(
          onPressed: () => Get.toNamed(Routes.QUESTION_DETAIL, arguments: q),
          child: const Text('풀기'),
        ),
      ),
    );
  }
}
