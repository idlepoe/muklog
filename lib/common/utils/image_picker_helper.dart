import 'package:image_picker/image_picker.dart';

class ImagePickerHelper {
  static Future<XFile?> pickImage() async {
    final picker = ImagePicker();
    return await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 75,
    );
  }
}
