import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/submit_question_controller.dart';

class SubmitQuestionView extends GetView<SubmitQuestionController> {
  const SubmitQuestionView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubmitQuestionView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubmitQuestionView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
