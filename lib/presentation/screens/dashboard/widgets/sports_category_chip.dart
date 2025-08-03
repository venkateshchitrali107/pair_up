import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pair_up/presentation/themes/app_colors.dart';

import '../../../../utils/constants/size.dart';
import '../constants/animation_constants.dart';

class SportsCategoryChip extends StatelessWidget {
  final String? label;
  final String? icon;
  final IconData? iconData;
  final bool isSelected;
  final VoidCallback onTap;

  const SportsCategoryChip({
    super.key,
    this.label,
    this.icon,
    this.iconData,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedSwitcher(
        duration: DashboardAnimationConstants.chipSwitchDuration,
        switchInCurve: DashboardAnimationConstants.easeInOutCurve,
        switchOutCurve: DashboardAnimationConstants.easeInOutCurve,
        transitionBuilder: (Widget child, Animation<double> animation) {
          return ScaleTransition(scale: animation, child: child);
        },
        child:
            isSelected
                ? _buildSelectedChip(context)
                : _buildUnselectedChip(context),
      ),
    );
  }

  Widget _buildSelectedChip(BuildContext context) {
    return AnimatedContainer(
      key: DashboardAnimationConstants.selectedChipKey,
      duration: DashboardAnimationConstants.chipSwitchDuration,
      curve: DashboardAnimationConstants.easeInOutCurve,
      padding: EdgeInsets.symmetric(
        horizontal: Sizes.dimen_12.w,
        vertical: Sizes.dimen_12.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.selectedButton,
        borderRadius: BorderRadius.circular(Sizes.dimen_24.r),
        border: Border.all(color: AppColors.selectedButton, width: 1),
      ),
      child: AnimatedDefaultTextStyle(
        duration: DashboardAnimationConstants.chipSwitchDuration,
        style:
            Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ) ??
            const TextStyle(),
        child: Text(label ?? ''),
      ),
    );
  }

  Widget _buildUnselectedChip(BuildContext context) {
    return AnimatedContainer(
      key: DashboardAnimationConstants.unselectedChipKey,
      duration: DashboardAnimationConstants.chipSwitchDuration,
      curve: DashboardAnimationConstants.easeInOutCurve,
      padding: EdgeInsets.all(Sizes.dimen_10.w),
      height: Sizes.dimen_46.w,
      width: Sizes.dimen_46.w,
      decoration: BoxDecoration(
        color: Colors.transparent,
        shape: BoxShape.circle,
        border: Border.all(color: AppColors.cardBorder, width: 0.5),
      ),
      child: AnimatedScale(
        duration: DashboardAnimationConstants.chipScaleDuration,
        scale: DashboardAnimationConstants.defaultScale,
        child: _buildIcon(),
      ),
    );
  }

  Widget _buildIcon() {
    if (icon != null) {
      return SvgPicture.asset(
        icon!,
        width: Sizes.dimen_20.sp,
        height: Sizes.dimen_20.sp,
        colorFilter: ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
      );
    } else if (iconData != null) {
      return Icon(
        iconData!,
        size: Sizes.dimen_20.sp,
        color: AppColors.textPrimary,
      );
    }
    return SizedBox.shrink();
  }
}
