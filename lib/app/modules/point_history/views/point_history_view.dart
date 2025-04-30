import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/point_history_controller.dart';

class PointHistoryView extends GetView<PointHistoryController> {
  const PointHistoryView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PointHistoryView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PointHistoryView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
