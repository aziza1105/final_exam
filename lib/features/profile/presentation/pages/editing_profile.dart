import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class EditingProfileScreen extends StatefulWidget {
  const EditingProfileScreen({super.key});

  @override
  State<EditingProfileScreen> createState() => _EditingProfileScreenState();
}

class _EditingProfileScreenState extends State<EditingProfileScreen> {
  File? avatar;
  final _name = Hive.box("name");
  final _location = Hive.box("location");
  final avatarBox = Hive.box('avatar');

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _profileData();
  }

  Future<void> _profileData() async {
    final name = await _name.get(1) ?? '';
    final location = await _location.get(1) ?? '';
    final avatarPath = await avatarBox.get('avatar_path');

    if (avatarPath != null) {
      avatar = File(avatarPath);
    }

    setState(() {
      _nameController.text = name;
      _locationController.text = location;
    });
  }

  Future<void> pickerAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File(file.path);
      });
      await avatarBox.put('avatar_path', file.path);
    }
  }

  void _saveProfileData() async {
    _name.put(1, _nameController.text);
    _location.put(1, _locationController.text);

    if (avatar != null) {
      await avatarBox.put('avatar_path', avatar!.path);
    }

    Navigator.pop(context, {
      'name': _nameController.text,
      'location': _locationController.text,
      'avatar': avatar != null ? avatar!.path : null,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Padding(
          padding: EdgeInsets.only(left: 75, right: 90),
          child: Text(
            "Profil ma'lumotlari",
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    height: 370,
                    width: double.infinity,
                    child: Material(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                  ),
                  Positioned(
                    top: 16,
                    child: GestureDetector(
                      onTap: () {
                        pickerAvatar();
                      },
                      child: Container(
                        height: 72,
                        width: 72,
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 1, color: Colors.grey),
                        ),
                        child: avatar == null
                            ? const Icon(Icons.person,
                                size: 60, color: Colors.grey)
                            : Image.file(
                                avatar!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 115,
                    left: 16,
                    right: 16,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'F.I.Sh',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const Gap(12),
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: "Ismingizni kiriting",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Positioned(
                    bottom: 12,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Manzilingiz',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const Gap(10),
                        Container(
                          constraints: const BoxConstraints.tightFor(
                              width: 320.0, height: 120.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: TextField(
                            controller: _locationController,
                            maxLines: null,
                            expands: true,
                            decoration: const InputDecoration(
                              hintText: "Manzil kiriting",
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 260),
            ElevatedButton(
              onPressed: () {
                _saveProfileData();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minimumSize: const Size(double.infinity, 48),
              ),
              child: const Text('Saqlash',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500)),
            ),
          ],
        ),
      ),
    );
  }
}
