import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pair_up/presentation/themes/app_colors.dart';

import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';

class BellIconWidget extends StatelessWidget {
  const BellIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_66.sp,
      height: Sizes.dimen_66.sp,
      decoration: BoxDecoration(
        color: AppColors.appbarIconBg,
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
      ),
      child: Center(
        child: SvgPicture.asset(
          AssetsConstants.bellBing,
          width: Sizes.dimen_24.sp,
          height: Sizes.dimen_24.sp,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.notifications,
              size: Sizes.dimen_24.sp,
              color: AppColors.secondaryTextColor,
            );
          },
        ),
      ),
    );
  }
}
