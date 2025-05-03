import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

class PointGainDialog extends StatelessWidget {
  final int points;
  final bool levelUp;
  final int? newLevel;

  const PointGainDialog({
    required this.points,
    this.levelUp = false,
    this.newLevel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('🎉 출제 성공!'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Lottie.asset('assets/animations/celebrate.json', height: 100),
          const SizedBox(height: 16),
          Text(
            '+$points 포인트 획득!',
            style: const TextStyle(fontSize: 18),
          ),
          if (levelUp && newLevel != null) ...[
            const SizedBox(height: 12),
            const Divider(),
            const SizedBox(height: 8),
            const Text('🎖️ 레벨업!', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            Text('새로운 레벨: $newLevel', style: const TextStyle(fontSize: 16)),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('닫기'),
        ),
      ],
    );
  }
}
