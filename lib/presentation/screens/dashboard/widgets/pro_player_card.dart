import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/entities/pro_player.dart';
import '../../../../utils/constants/size.dart';
import '../../../themes/app_colors.dart';

class ProPlayerCard extends StatelessWidget {
  final ProPlayer player;
  final VoidCallback? onTap;

  const ProPlayerCard({super.key, required this.player, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(Sizes.dimen_8.w),
        width: 0.86.sw,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(Sizes.dimen_24.r),
          border: Border.all(color: AppColors.darkGray, width: 0.5),
        ),
        child: Row(
          children: [
            Container(
              width: Sizes.dimen_66.w,
              height: Sizes.dimen_66.w,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: ClipOval(
                child: Image.asset(
                  player.profileImageUrl,
                  width: Sizes.dimen_66.w,
                  height: Sizes.dimen_66.w,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: Sizes.dimen_66.w,
                      height: Sizes.dimen_66.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.lightGray,
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

            SizedBox(width: Sizes.dimen_8.w),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: Sizes.dimen_4.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          player.name,
                          style: Theme.of(
                            context,
                          ).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,

                            fontSize: Sizes.dimen_14.sp,
                            color: AppColors.textPrimary,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: Sizes.dimen_4.w,
                          vertical: Sizes.dimen_2.h,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(Sizes.dimen_10.r),
                        ),
                        child: Text(
                          '${player.atpRanking} ATP',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall?.copyWith(
                            fontSize: Sizes.dimen_8.sp,
                            color: AppColors.white,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: Sizes.dimen_4.h),

                  if (player.isSubscribed) ...[
                    Row(
                      children: [
                        if (player.isSubscribed && player.videosLeft > 0) ...[
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.dimen_12.w,
                              vertical: Sizes.dimen_6.h,
                            ),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius: BorderRadius.circular(
                                Sizes.dimen_10.r,
                              ),
                            ),
                            child: Text(
                              '${player.videosLeft} Video${player.videosLeft > 1 ? 's' : ''} left',
                              style: Theme.of(
                                context,
                              ).textTheme.bodySmall?.copyWith(
                                color: AppColors.white,
                                fontSize: Sizes.dimen_8.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                        SizedBox(width: Sizes.dimen_4.w),
                        Text(
                          'Subscribed',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium?.copyWith(
                            color: AppColors.primary,
                            fontSize: Sizes.dimen_12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: Sizes.dimen_4.h),
                  ],

                  Text(
                    player.specialty,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: AppColors.textPrimary,
                      fontSize: Sizes.dimen_12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
