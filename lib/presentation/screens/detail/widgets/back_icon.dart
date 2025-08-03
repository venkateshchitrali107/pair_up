import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:pair_up/presentation/themes/app_colors.dart';

import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Container(
        width: Sizes.dimen_66.sp,
        height: Sizes.dimen_66.sp,
        decoration: BoxDecoration(
          color: AppColors.appbarIconBg,
          borderRadius: BorderRadius.circular(Sizes.dimen_28.r),
        ),
        child: Center(
          child: SvgPicture.asset(
            AssetsConstants.arrowLeft,
            width: Sizes.dimen_30.sp,
            height: Sizes.dimen_30.sp,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.arrow_back,
                size: Sizes.dimen_30.sp,
                color: AppColors.secondaryTextColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
