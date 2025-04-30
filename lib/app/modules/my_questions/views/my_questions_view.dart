import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/my_questions_controller.dart';

class MyQuestionsView extends GetView<MyQuestionsController> {
  const MyQuestionsView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyQuestionsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'MyQuestionsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
