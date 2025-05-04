import 'package:flutter/material.dart';

import '../../app/models/feed_quiz.dart';

Future<FeedQuiz?> showFeedQuizDialog(
  BuildContext context,
  String imageUrl, {
  FeedQuiz? existingQuiz,
}) async {
  final questionCtrl = TextEditingController(
    text: existingQuiz?.question ?? '이것은 가격을 얼마일까요?',
  );
  final List<TextEditingController> choiceCtrls = List.generate(
    4,
    (i) => TextEditingController(
      text:
          (existingQuiz?.choices.length ?? 0) > i
              ? existingQuiz!.choices[i]
              : '',
    ),
  );
  String? selectedAnswer = existingQuiz?.answer;

  return showDialog<FeedQuiz>(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          final validChoices =
              choiceCtrls
                  .map((c) => c.text)
                  .where((text) => text.trim().isNotEmpty)
                  .toSet()
                  .toList();

          if (!validChoices.contains(selectedAnswer)) {
            selectedAnswer = null;
          }

          return AlertDialog(
            title: const Text('퀴즈 만들기'),
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextField(
                    controller: questionCtrl,
                    decoration: const InputDecoration(labelText: '질문'),
                  ),
                  const SizedBox(height: 8),
                  ...List.generate(
                    4,
                    (i) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: TextField(
                        controller: choiceCtrls[i],
                        decoration: InputDecoration(labelText: '보기 ${i + 1}'),
                        onChanged: (_) => setState(() {}),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  DropdownButton<String>(
                    value:
                        validChoices.contains(selectedAnswer)
                            ? selectedAnswer
                            : null,
                    hint: const Text('정답 선택'),
                    isExpanded: true,
                    items:
                        validChoices
                            .map(
                              (text) => DropdownMenuItem(
                                value: text,
                                child: Text(text),
                              ),
                            )
                            .toList(),
                    onChanged:
                        (value) => setState(() => selectedAnswer = value),
                  ),
                ],
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('취소'),
              ),
              ElevatedButton(
                onPressed: () {
                  final quiz = FeedQuiz(
                    imageUrl: imageUrl,
                    question: questionCtrl.text,
                    choices: choiceCtrls.map((c) => c.text).toList(),
                    answer: selectedAnswer!,
                    rewardPoint: 2,
                  );
                  Navigator.pop(context, quiz);
                },
                child: const Text('저장'),
              ),
            ],
          );
        },
      );
    },
  );
}
