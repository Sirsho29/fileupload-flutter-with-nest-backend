import 'dart:io';

import 'package:fileupload/upload_function.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ElevatedButton(
          child: const Text("Upload"),
          onPressed: () {
            ImagePicker().pickImage(source: ImageSource.gallery).then(
                  (value) => FileUploadService.onlyUploadSingleImageDio(
                    File(value!.path),
                  ),
                );
          },
        ),
      ),
    );
  }
}
