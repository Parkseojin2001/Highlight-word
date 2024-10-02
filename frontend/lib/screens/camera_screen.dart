import 'dart:io';
import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/widgets/dropdown_widget.dart';
import 'package:frontend/services/upload_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final _langList = ['English', 'Spanish', 'Korean', 'French'];
  final _colorList = ['Pink', 'Orange', 'Yellow', 'Green', 'Blue', 'Purple'];
  File? _image;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(
        () {
          _image = File(pickedFile.path);
        },
      );
      await UploadService.uploadImage(_image!);
    }
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(
        () {
          _image = File(pickedFile.path);
        },
      );
      await UploadService.uploadImage(_image!);
    }
  }

  Future<void> _pickFile() async {
    final pickedFile = await FilePicker.platform.pickFiles();
    if (pickedFile != null) {
      setState(
        () {
          _image = File(pickedFile.files.single.path!);
        },
      );
      await UploadService.uploadImage(_image!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff87A2FF),
          title: const Text(
            "Capter / Upload",
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.w800, color: Colors.white),
          ),
          leading: IconButton(
            padding: const EdgeInsets.only(left: 10),
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
              );
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Select language",
                style: TextStyle(fontSize: 17),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DropdownWidget(valueList: _langList, value: 'English'),
                  const SizedBox(
                    width: 30,
                  ),
                  const Icon(
                    Icons.arrow_right_alt_rounded,
                    size: 50,
                    color: Color(0xff705C53),
                  ),
                  const SizedBox(
                    width: 30,
                  ),
                  DropdownWidget(valueList: _langList, value: 'Korean'),
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                "Select highlight color",
                style: TextStyle(fontSize: 17),
              ),
              const SizedBox(height: 10),
              DropdownWidget(valueList: _colorList, value: 'Yellow'),
              const SizedBox(height: 40),
              IconButton(
                onPressed: _pickImageFromCamera,
                icon: const Icon(
                  Icons.camera_rounded,
                  size: 150,
                  color: Color(0xffD8D2C2),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              IconButton(
                onPressed: _pickFile,
                icon: const Icon(
                  Icons.upload_file,
                  size: 150,
                  color: Color(0xffD8D2C2),
                ),
              ),
              if (_image != null)
                Image.file(
                  _image!,
                  height: 200,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
