
import 'package:final_exam/assets/colors.dart';
import 'package:final_exam/assets/icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';




class ArtclesScreen extends StatelessWidget {
  const ArtclesScreen({super.key});

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
        body:


          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ), SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                              Gap(30),

                              Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),SizedBox(height: 10), // Add some spacing between containers
                  Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: borderColor,
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(12),
                        right: Radius.circular(12),
                      ),
                      border: Border.all(color: Colors.blue),
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
                          SizedBox(height: 6),
                          Text(
                            "Dr. Alisher Bahodirovich",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),



                          SizedBox(height: 6),
                          Text(
                            "Kardiologiya",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: hintTextColor
                            ),
                          ),
                          SizedBox(height: 8),

                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabit a enim.",
                            style: Theme.of(context).textTheme.headline1!.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                                color: hintTextColor
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  ' ${DateFormat('dd.MM.yyyy').format(DateTime.now())}',
                                  style: Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: hintTextColor,
                                  ),
                                ),
                              ),
                                Gap(30),

                                   Icon(Icons.bookmark_border)
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
          )

       );
  }
}

