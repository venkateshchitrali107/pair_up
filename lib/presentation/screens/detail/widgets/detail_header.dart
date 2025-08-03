import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pair_up/presentation/screens/detail/widgets/back_icon.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const BackIcon(),
        SizedBox(width: Sizes.dimen_8.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.loc.addDetails,
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: Sizes.dimen_18.sp,
                color: AppColors.textPrimary,
              ),
            ),
            SizedBox(height: Sizes.dimen_4.h),
            Text(
              context.loc.premadeTem,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.secondaryTextColor,
                fontSize: Sizes.dimen_12.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
