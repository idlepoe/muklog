import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../common/widgets/bottom_button.dart';
import '../controllers/question_detail_controller.dart';

class QuestionDetailView extends GetView<QuestionDetailController> {
  const QuestionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final q = controller.question;

    return Scaffold(
      appBar: AppBar(title: const Text('문제 풀기')),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(16),
          child:
              controller.alreadySolved.value
                  ? Center(child: Text('이미 푼 문제입니다.\n해설만 확인하세요.'))
                  : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder:
                                  (_) => Dialog(
                                    child: InteractiveViewer(
                                      child: Image.network(q.imageUrl),
                                    ),
                                  ),
                            );
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              q.imageUrl,
                              width: double.infinity,
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(q.question, style: const TextStyle(fontSize: 18)),
                        const SizedBox(height: 16),
                        ...q.choices.map(
                          (choice) => Obx(() {
                            final isSelected =
                                controller.selected.value == choice;
                            final isCorrectAnswer =
                                controller.isAnswered.value &&
                                q.answer == choice;
                            final isWrongAnswer =
                                controller.isAnswered.value &&
                                isSelected &&
                                !isCorrectAnswer;

                            return Center(
                              child: GestureDetector(
                                onTap: () => controller.selectChoice(choice),
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.symmetric(
                                    vertical: 6,
                                    horizontal: 20,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color:
                                          isCorrectAnswer
                                              ? Colors.green
                                              : isWrongAnswer
                                              ? Colors.red
                                              : isSelected
                                              ? Colors.blue
                                              : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color:
                                        isCorrectAnswer
                                            ? Colors.green[100]
                                            : isWrongAnswer
                                            ? Colors.red[100]
                                            : isSelected
                                            ? Colors.blue[50]
                                            : Colors.white,
                                  ),
                                  child: Text(
                                    '${q.choices.indexOf(choice) + 1}) $choice',
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 24),
                        if (!controller.isAnswered.value)
                          BottomButton(
                            text: "정답 확인",
                            onPressed: controller.submitAnswer,
                          )
                        else ...[
                          Text(
                            controller.isCorrectAnswer.value
                                ? '🎉 정답입니다! +${controller.pointEarned.value}점'
                                : '❌ 오답입니다.',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            '해설: ${q.explanation}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          const SizedBox(height: 16),
                          OutlinedButton(
                            onPressed: controller.likeQuestion,
                            style: OutlinedButton.styleFrom(
                              side: BorderSide(color: Colors.grey.shade400),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.thumb_up_alt_outlined),
                                const SizedBox(width: 8),
                                Text(
                                  '${controller.question.likeCount}명이 좋아했어요',
                                ),
                              ],
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.exit_to_app),
                            label: const Text('나가기'),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 32,
                                vertical: 14,
                              ),
                              backgroundColor: Colors.grey[200],
                              foregroundColor: Colors.black87,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
        );
      }),
    );
  }
}
