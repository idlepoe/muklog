import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/init_user_profile_controller.dart';

class InitUserProfileView extends GetView<InitUserProfileController> {
  const InitUserProfileView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InitUserProfileView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InitUserProfileView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
