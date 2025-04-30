import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/image_preview_controller.dart';

class ImagePreviewView extends GetView<ImagePreviewController> {
  const ImagePreviewView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ImagePreviewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ImagePreviewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
