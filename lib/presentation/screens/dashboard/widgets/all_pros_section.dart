import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain/entities/pro_player.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';
import 'featured_pro_card.dart';

class AllProsSection extends StatelessWidget {
  final List<ProPlayer> allPlayers;
  final VoidCallback? onSeeAllTap;

  const AllProsSection({super.key, required this.allPlayers, this.onSeeAllTap});

  List<ProPlayer> _getRandomPlayers() {
    if (allPlayers.isEmpty) return [];

    final shuffledPlayers = List<ProPlayer>.from(allPlayers);
    shuffledPlayers.shuffle();

    return shuffledPlayers.take(8).toList();
  }

  @override
  Widget build(BuildContext context) {
    final randomPlayers = _getRandomPlayers();

    if (randomPlayers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.allPros,
              style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 16.sp,
                color: AppColors.textPrimary,
              ),
            ),
            GestureDetector(
              onTap: onSeeAllTap,
              child: Container(
                width: Sizes.dimen_44.w,
                height: Sizes.dimen_44.w,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.cardBorder, width: 0.5),
                  borderRadius: BorderRadius.circular(Sizes.dimen_20.r),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AssetsConstants.arrowRightUp,
                    width: Sizes.dimen_20.sp,
                    height: Sizes.dimen_20.sp,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: Sizes.dimen_8.h),

        SizedBox(
          height: Sizes.dimen_190.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: randomPlayers.length,
            separatorBuilder:
                (context, index) => SizedBox(width: Sizes.dimen_8.w),
            itemBuilder: (context, index) {
              final player = randomPlayers[index];
              return FeaturedProCard(
                player: player,
                onTap: () {
                  debugPrint('Tapped on all pro: ${player.name}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
