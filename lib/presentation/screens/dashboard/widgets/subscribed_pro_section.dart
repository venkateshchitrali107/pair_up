import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../domain/entities/pro_player.dart';
import '../../../../utils/constants/assets_constants.dart';
import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import '../../../themes/app_colors.dart';
import 'pro_player_card.dart';

class SubscribedProSection extends StatelessWidget {
  final List<ProPlayer> subscribedPlayers;
  final VoidCallback? onSeeAllTap;

  const SubscribedProSection({
    super.key,
    required this.subscribedPlayers,
    this.onSeeAllTap,
  });

  List<ProPlayer> _getRandomSubscribedPlayers() {
    final subscribedProPlayers =
        subscribedPlayers.where((player) => player.isSubscribed).toList();

    if (subscribedProPlayers.isEmpty) return [];

    final shuffledPlayers = List<ProPlayer>.from(subscribedProPlayers);
    shuffledPlayers.shuffle();

    return shuffledPlayers.take(9).toList();
  }

  @override
  Widget build(BuildContext context) {
    final randomSubscribedPlayers = _getRandomSubscribedPlayers();

    if (randomSubscribedPlayers.isEmpty) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              context.loc.subscribedPro,
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
          height: Sizes.dimen_86.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: randomSubscribedPlayers.length,
            separatorBuilder:
                (context, index) => SizedBox(width: Sizes.dimen_6.w),
            itemBuilder: (context, index) {
              final player = randomSubscribedPlayers[index];
              return ProPlayerCard(
                player: player,
                onTap: () {
                  debugPrint('Tapped on ${player.name}');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
