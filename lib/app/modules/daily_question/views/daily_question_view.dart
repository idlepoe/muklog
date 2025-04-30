import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/daily_question_controller.dart';

class DailyQuestionView extends GetView<DailyQuestionController> {
  const DailyQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DailyQuestionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DailyQuestionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
