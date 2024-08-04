import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:image_picker/image_picker.dart';

class PalmScannerController extends GetxController {
  final ImageLabeler _imageLabeler =
      ImageLabeler(options: ImageLabelerOptions());
  var isPalmDetected = false.obs;
  var pickedImage = ''.obs;

  Future<void> detectPalm(String imagePath) async {
    final inputImage = InputImage.fromFilePath(imagePath);
    final List<ImageLabel> labels =
        await _imageLabeler.processImage(inputImage);

    isPalmDetected.value =
        labels.any((label) => label.label.toLowerCase().contains('palm'));

    if (!isPalmDetected.value) {
      Get.snackbar('Error', 'Palm is not detected.');
    }
  }

  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      pickedImage.value = pickedFile.path;
      await detectPalm(pickedFile.path);
    }
  }

  @override
  void onClose() {
    _imageLabeler.close();
    super.onClose();
  }
}
// import 'package:get/get.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
// import 'package:image_picker/image_picker.dart';

// class PalmScannerController extends GetxController {
//   final ImageLabeler _imageLabeler = GoogleMlKit.vision.imageLabeler();
//   var isPalmDetected = false.obs;
//   var pickedImage = ''.obs;

//   Future<void> detectPalm(String imagePath) async {
//     final inputImage = InputImage.fromFilePath(imagePath);
//     final List<ImageLabel> labels = await _imageLabeler.processImage(inputImage);

//     isPalmDetected.value = labels.any((label) => label.label.toLowerCase().contains('palm'));

//     if (!isPalmDetected.value) {
//       Get.snackbar('Error', 'Palm is not detected.');
//     }
//   }

//   Future<void> pickImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
//     if (pickedFile != null) {
//       pickedImage.value = pickedFile.path;
//       await detectPalm(pickedFile.path);
//     }
//   }

//   @override
//   void onClose() {
//     _imageLabeler.close();
//     super.onClose();
//   }
// }
