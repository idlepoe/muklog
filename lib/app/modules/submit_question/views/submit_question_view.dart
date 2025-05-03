import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common/widgets/bottom_button.dart';
import '../../../../common/widgets/x_file_preview.dart';
import '../../../models/generated_question.dart';
import '../controllers/submit_question_controller.dart';

class SubmitQuestionView extends GetView<SubmitQuestionController> {
  const SubmitQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('문제 출제')),
      body: Obx(() {
        final step = controller.step.value;

        if (step != SubmitStep.idle) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(
                  controller.loadingMessage,
                  style: const TextStyle(color: Colors.black87),
                ),
              ],
            ),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(16),
          child:
              controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: controller.pickImage,
                          child:
                              controller.selectedImage.value == null
                                  ? Container(
                                    height: 200,
                                    color: Colors.grey[300],
                                    child: const Center(
                                      child: Text('사진을 선택하세요'),
                                    ),
                                  )
                                  : XFilePreview(
                                    file: controller.selectedImage.value!,
                                    height: 200,
                                    width: double.infinity,
                                  ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          controller: controller.priceController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            labelText: '가격 입력 (원)',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        const SizedBox(height: 16),
                        BottomButton(
                          text: "AI 문제 생성",
                          onPressed: controller.generateQuestion,
                        ),
                        const SizedBox(height: 16),
                        if (controller.generatedQuestion.value != null)
                          buildQuestionPreview(
                            controller.generatedQuestion.value!,
                            context,
                          ),
                      ],
                    ),
                  ),
        );
      }),
    );
  }

  // 문제 미리보기 UI 예시 위젯
  Widget buildQuestionPreview(GeneratedQuestion q, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 24),
        Divider(),
        const Text(
          '문제 미리보기',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          'Q. ${q.question}',
          style: const TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        ...q.choices.asMap().entries.map((entry) {
          final index = entry.key;
          final choice = entry.value;
          final isCorrect = choice == q.answer;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              '${index + 1}) $choice',
              style: TextStyle(
                fontSize: 15,
                fontWeight: isCorrect ? FontWeight.bold : FontWeight.normal,
                color: isCorrect ? Colors.green[700] : Colors.black,
              ),
            ),
          );
        }),
        const SizedBox(height: 16),
        Text(
          '해설: ${q.explanation}',
          style: const TextStyle(fontSize: 14, color: Colors.grey),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        BottomButton(text: "문제 출제하기", onPressed: controller.submitQuestion),
      ],
    );
  }
}
