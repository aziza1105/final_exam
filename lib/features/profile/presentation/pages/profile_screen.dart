import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:final_exam/assets/icons.dart';
import 'editing_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File? avatar;
  String _name = '';
  String _location = '';

  @override
  void initState() {
    super.initState();
    _profileData();
  }

  Future<void> _profileData() async {
    final boxName = Hive.box("name");
    final locationBox = Hive.box("location");
    final name = await boxName.get(1, defaultValue: 'Ismingizni kiriting ');
    final location = await locationBox.get(1, defaultValue: 'Manzilingizni kiritng');
    final avatarBox = Hive.box("avatar");
    final avatarPath = avatarBox.get('avatar_path');
    if (avatarPath != null) {
      setState(() {
        avatar = File(avatarPath);
      });
    }

    setState(() {
      _name = name;
      _location = location;
    });
  }

  Future<void> pickerAvatar() async {
    ImagePicker imagePicker = ImagePicker();
    final file = await imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      setState(() {
        avatar = File.fromUri(Uri.file(file.path));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        title: const Center(
            child: Text(
          "Profil ",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black),
        )),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: 335,
                  width: double.infinity,
                  child: Material(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 16,
                  child: Container(
                    height: 49,
                    width: 49,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                        border: Border.all(width: 1, color: Colors.grey)),
                    child: avatar == null
                        ? const Icon(Icons.person, size: 45, color: Colors.grey)
                        : Image.file(
                            avatar!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Positioned(top: 12, right: 12,
                    child:GestureDetector(
                  onTap: () async {
                    final updatedData = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const EditingProfileScreen()),
                    );
                    if (updatedData != null) {
                      setState(() {
                        _name = updatedData['name'];
                        _location = updatedData['location'];
                        avatar = updatedData['avatar'] != null ? File(updatedData['avatar']) : null;
                      });
                    }
                  },
                  child: SvgPicture.asset(AppIcons.arrow),
                ),
                ),




                Positioned(
                  top: 108,
                  left: 16,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(_name,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),


                      Text(_location,
                          style: const TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
           // Container(
             // height: 90,
              //width: double.infinity,
              //decoration: BoxDecoration(
                 // color: Colors.white, borderRadius: BorderRadius.circular(12)),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const EditingProfileScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(

                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            AppIcons.exit,
                            height: 24,
                            width: 24,
                          ),
                          const Gap(8),
                          const Text('Logout',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14)),
                        ])

                ),

              ),
                Column(
                  children: [
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12)),

                    ),
                    const Gap(28),
                    Container(
                      height: 56,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white, borderRadius: BorderRadius.circular(12)),

                    ),
                  ],
                ),

          ]
    )
    ),
    );
  }
}
