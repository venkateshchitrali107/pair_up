import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pair_up/presentation/themes/app_colors.dart';

import '../../../../domain/entities/pro_player.dart';
import '../../../../utils/constants/size.dart';
import 'player_card.dart';

class PlayersSection extends StatelessWidget {
  const PlayersSection({super.key});

  List<ProPlayer> _getRandomPlayers() {
    final allPlayers = ProPlayer.mockPlayers;
    if (allPlayers.isEmpty) return [];

    final shuffledPlayers = List<ProPlayer>.from(allPlayers);
    shuffledPlayers.shuffle();

    return shuffledPlayers.take(9).toList();
  }

  @override
  Widget build(BuildContext context) {
    final players = _getRandomPlayers();

    if (players.length < 4) {
      return const SizedBox.shrink();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlayerCard(
          player1: players[0],
          player2: players[4], // Different random player
          onTap: () {
            debugPrint(
              'Tapped on players: ${players[0].name} & ${players[4].name}',
            );
          },
        ),
        SizedBox(width: Sizes.dimen_1.w),
        Container(
          width: Sizes.dimen_2.w,
          height: Sizes.dimen_20.h,
          color: AppColors.cardBorder,
        ),
        SizedBox(width: Sizes.dimen_1.w),
        PlayerCard(
          player1: players[2],
          player2: players[5], // Different random player
          onTap: () {
            debugPrint(
              'Tapped on players: ${players[2].name} & ${players[5].name}',
            );
          },
        ),
      ],
    );
  }
}
