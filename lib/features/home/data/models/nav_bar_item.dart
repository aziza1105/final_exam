import 'package:final_exam/assets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'navbar_models.dart';


class TabItemWidget extends StatelessWidget {
  final bool isActive;
  final NavBar item;
  final VoidCallback? onActiveTap;

  const TabItemWidget({
    required this.item,
    Key? key,
    this.isActive = false,
    this.onActiveTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        behavior: HitTestBehavior.deferToChild,
        onTap: isActive
            ? () {
                if (isActive && onActiveTap != null) {
                  onActiveTap!();
                }
              }
            : null,
        child: Container(
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (item.id != 2)
                SvgPicture.asset(
                  item.icon,
                  color: isActive ? activeColor : inActiveColor,
                ),
              if (item.id == 2)
                SvgPicture.asset(
                  item.icon,
                  color: isActive ? activeColor : inActiveColor,
                ),
              Text(
                item.title,
                style: TextStyle(
                  color: isActive ? activeColor : inActiveColor,
                ),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ],
          ),
        ),
      );
}
