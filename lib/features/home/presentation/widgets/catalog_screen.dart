import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_exam/assets/colors.dart';
import 'package:final_exam/assets/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

import '../../data/data/models/status.dart';
import '../../data/data/models/task_models.dart';
import '../bloc/task_bloc.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          toolbarHeight: 130,
          title: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppIcons.logo,
                      width: 142,
                      height: 50,
                    ),
                    const Gap(162),
                    SvgPicture.asset(
                      AppIcons.notification,
                    ),
                  ],
                ),
                const Gap(15),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: borderColor,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        icon: SvgPicture.asset(AppIcons.search,
                            height: 24, width: 24),
                        onPressed: () async {},
                      ),
                      const Expanded(
                        child: TextField(
                          cursorColor: null,
                          decoration: InputDecoration(
                            hintText: 'Ilmiy maqolalarni izlash',
                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: hintTextColor,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Gap(22),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Text(
              textAlign: TextAlign.start,
              'Turkumlar',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          const Gap(20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(children: [
              Container(
                width: 160,
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                      color: black.withOpacity(0.25),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 42,
                      height: 42,
                      child: SvgPicture.asset(AppIcons.cardiology),
                    ),
                    const Spacer(),
                    Text(
                      "Psixologiya",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 16),
                    //WScaleAnimation(
                    // onTap: onTap,
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: borderColor, width: 1),
                      ),
                      child: Text(
                        'Turkumga kirish',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      // ),
                    ),
                  ],
                ),
              ),
              const Gap(4),
              Container(
                width: 160,
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                      color: black.withOpacity(0.25),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 42,
                      height: 42,
                      child: SvgPicture.asset(AppIcons.heart),
                    ),
                    const Spacer(),
                    Text(
                      "Kardiologiya",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 16),
                    //WScaleAnimation(
                    // onTap: onTap,
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: borderColor, width: 1),
                      ),
                      child: Text(
                        'Turkumga kirish',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      // ),
                    ),
                  ],
                ),
              ),
              const Gap(4),
              Container(
                width: 160,
                height: 150,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(2, 2),
                      blurRadius: 10,
                      color: black.withOpacity(0.25),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 42,
                      height: 42,
                      child: SvgPicture.asset(AppIcons.nevrologiya),
                    ),
                    const Spacer(),
                    Text(
                      "Nevrologiya",
                      style: Theme.of(context).textTheme.headline1!.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    const SizedBox(height: 16),
                    //WScaleAnimation(
                    // onTap: onTap,
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: borderColor, width: 1),
                      ),
                      child: Text(
                        'Turkumga kirish',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                      // ),
                    ),
                  ],
                ),
              ),
            ]),
          ),

          //-------------------

          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "So’nggi maqolalar",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                      color: Colors.black),
                ),
                Text(
                  "Barcha maqolalar",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.blue),
                ),
              ],
            ),
          ),



          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kunlik badantarbiyaning foydalari",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Dr. Alisher Bahodirovich / ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                              style: Theme.of(context).textTheme.headline3!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consect amet commodo velit iaculis ut. Donec enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: const BoxDecoration(
                      color: borderColor,

                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kunlik badantarbiyaning foydalari",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Text(
                              'Dr. Alisher Bahodirovich / ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                              style: Theme.of(context).textTheme.headline3!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ), const SizedBox(height: 16),









                ],
              ),
            ),
          )

        ]));
  }
}

