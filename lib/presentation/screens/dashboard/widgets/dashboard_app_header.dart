import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';
import 'bell_icon_widget.dart';
import 'profile_icon_widget.dart';

class DashboardAppHeader extends StatelessWidget {
  const DashboardAppHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.loc.selectAPro,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: AppColors.textPrimary,
                ),
              ),
              SizedBox(height: Sizes.dimen_4.h),
              Text(
                context.loc.chooseYourDesiredPro,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppColors.secondaryTextColor,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        const BellIconWidget(),
        SizedBox(width: Sizes.dimen_8.h),
        const ProfileIconWidget(),
      ],
    );
  }
}
