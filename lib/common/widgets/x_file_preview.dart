import 'dart:typed_data';
import 'dart:io' as io;
import 'package:flutter/foundation.dart'; // kIsWeb
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class XFilePreview extends StatelessWidget {
  final XFile file;
  final double width;
  final double height;
  final BoxFit fit;
  final BorderRadius borderRadius;

  const XFilePreview({
    Key? key,
    required this.file,
    this.width = 40,
    this.height = 40,
    this.fit = BoxFit.cover,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // 🔥 웹에서는 readAsBytes() + MemoryImage
      return FutureBuilder<Uint8List>(
        future: file.readAsBytes(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return _placeholder();
          }

          if (!snapshot.hasData) {
            return _placeholder();
          }

          return _buildImage(MemoryImage(snapshot.data!));
        },
      );
    } else {
      // 🔥 모바일은 FileImage로 바로
      return _buildImage(
        FileImage(io.File(file.path)),
      );
    }
  }

  Widget _placeholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: borderRadius,
      ),
    );
  }

  Widget _buildImage(ImageProvider imageProvider) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        image: DecorationImage(
          image: imageProvider,
          fit: fit,
        ),
      ),
    );
  }
}
