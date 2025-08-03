import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pair_up/presentation/themes/app_colors.dart';

import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';

class ProfileIconWidget extends StatelessWidget {
  const ProfileIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimen_66.sp,
      height: Sizes.dimen_66.sp,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
        child: Image.asset(
          AssetsConstants.profileImage,
          width: Sizes.dimen_66.sp,
          height: Sizes.dimen_66.sp,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              width: Sizes.dimen_66.sp,
              height: Sizes.dimen_66.sp,
              decoration: BoxDecoration(
                color: AppColors.appbarIconBg,
                borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
              ),
              child: Icon(
                Icons.person,
                size: Sizes.dimen_24.sp,
                color: AppColors.textPrimary,
              ),
            );
          },
        ),
      ),
    );
  }
}
