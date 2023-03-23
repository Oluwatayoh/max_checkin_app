import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: Duration(seconds: 3),
      elevation: 4,
      padding: const EdgeInsets.all(15.0),
      content: Text(
        content,
        style: GoogleFonts.nunitoSans(
          fontSize: 12.sp,
        ),
      ),
    ),
  );
}

// Future<File?> pickImageFromGallery(BuildContext context) async {
//   File? image;
//   try {
//     final pickedImage =
//         await ImagePicker().pickImage(source: ImageSource.gallery);

//     if (pickedImage != null) {
//       image = File(pickedImage.path);
//     }
//   } catch (e) {
//     showSnackBar(context: context, content: e.toString());
//   }
//   return image;
// }

// Future<File?> pickVideoFromGallery(BuildContext context) async {
//   File? video;
//   try {
//     final pickedVideo =
//         await ImagePicker().pickVideo(source: ImageSource.gallery);

//     if (pickedVideo != null) {
//       video = File(pickedVideo.path);
//     }
//   } catch (e) {
//     showSnackBar(context: context, content: e.toString());
//   }
//   return video;
// }

// Future<GiphyGif?> pickGIF(BuildContext context) async {
//   GiphyGif? gif;
//   try {
//     gif = await Giphy.getGif(
//       context: context,
//       apiKey: 'pwXu0t7iuNVm8VO5bgND2NzwCpVH9S0F',
//     );
//   } catch (e) {
//     showSnackBar(context: context, content: e.toString());
//   }
//   return gif;
// }
