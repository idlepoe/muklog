import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/following_controller.dart';

class FollowingView extends GetView<FollowingController> {
  const FollowingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FollowingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FollowingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
