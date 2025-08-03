import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/pro_player.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';
import '../../../themes/app_colors.dart';

class FeaturedProCard extends StatelessWidget {
  final ProPlayer player;
  final VoidCallback? onTap;

  const FeaturedProCard({super.key, required this.player, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Sizes.dimen_160.w,
        padding: EdgeInsets.all(Sizes.dimen_12.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
          border: Border.all(color: AppColors.darkGray, width: 0.5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      width: Sizes.dimen_80.w,
                      height: Sizes.dimen_80.w,
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: ClipOval(
                        child: Image.asset(
                          player.profileImageUrl,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                color: AppColors.lightGray,
                                borderRadius: BorderRadius.circular(
                                  Sizes.dimen_12.r,
                                ),
                              ),
                              child: Icon(
                                Icons.person,
                                size: Sizes.dimen_40.sp,
                                color: AppColors.textSecondary,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: Sizes.dimen_8.h),
                  ],
                ),

                Positioned(
                  left: Sizes.dimen_30.w / 2,
                  right: Sizes.dimen_30.w / 2,
                  bottom: Sizes.dimen_0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: Sizes.dimen_4.h,
                      vertical: Sizes.dimen_4.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(Sizes.dimen_12.r),
                    ),
                    child: Text(
                      '${player.atpRanking} ATP',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: Sizes.dimen_8.sp,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: Sizes.dimen_12.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_30.w),
              child: Text(
                player.name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: Sizes.dimen_14.sp,
                  color: AppColors.textPrimary,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            SizedBox(height: Sizes.dimen_4.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AssetsConstants.star,
                  width: Sizes.dimen_14.sp,
                  height: Sizes.dimen_14.sp,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: Sizes.dimen_14.sp,
                      height: Sizes.dimen_14.sp,
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(Sizes.dimen_4.r),
                      ),
                      child: Icon(
                        Icons.star,
                        size: Sizes.dimen_12.sp,
                        color: AppColors.textSecondary,
                      ),
                    );
                  },
                ),
                SizedBox(width: Sizes.dimen_4.w),
                Text(
                  player.rating.toString(),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.dimen_12.sp,
                    color: AppColors.textPrimary,
                  ),
                ),
                SizedBox(width: Sizes.dimen_4.w),
                Text(
                  '(546)',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: Sizes.dimen_12.sp,
                    color: AppColors.secondaryTextColor,
                  ),
                ),
              ],
            ),

            SizedBox(height: Sizes.dimen_8.h),

            Text(
              player.specialty,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: Sizes.dimen_12.sp,
                color: AppColors.textPrimary,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: Sizes.dimen_8.h),
          ],
        ),
      ),
    );
  }
}
