import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/feed_following_controller.dart';

class FeedFollowingView extends GetView<FeedFollowingController> {
  const FeedFollowingView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FeedFollowingView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FeedFollowingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
