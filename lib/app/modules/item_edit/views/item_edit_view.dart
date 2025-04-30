import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/item_edit_controller.dart';

class ItemEditView extends GetView<ItemEditController> {
  const ItemEditView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ItemEditView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ItemEditView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
