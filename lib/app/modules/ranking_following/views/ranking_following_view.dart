import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/ranking_following_controller.dart';

class RankingFollowingView extends GetView<RankingFollowingController> {
  const RankingFollowingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RankingFollowingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RankingFollowingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
