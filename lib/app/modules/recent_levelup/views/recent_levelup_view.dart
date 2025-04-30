import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/recent_levelup_controller.dart';

class RecentLevelupView extends GetView<RecentLevelupController> {
  const RecentLevelupView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RecentLevelupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RecentLevelupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
