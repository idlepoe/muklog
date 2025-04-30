import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/submit_success_controller.dart';

class SubmitSuccessView extends GetView<SubmitSuccessController> {
  const SubmitSuccessView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SubmitSuccessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SubmitSuccessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
