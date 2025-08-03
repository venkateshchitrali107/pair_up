import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../utils/constants/size.dart';
import '../../themes/app_colors.dart';
import 'widgets/detail_header.dart';
import 'widgets/play_type_header.dart';
import 'widgets/players_section.dart';
import 'widgets/sports_header.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _State();
}

class _State extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(Sizes.dimen_12.w),
                child: Column(
                  children: [
                    const DetailHeader(),
                    SizedBox(height: Sizes.dimen_12.h),
                    const SportsHeader(),
                    SizedBox(height: Sizes.dimen_12.h),
                    const PlayTypeHeader(),
                    SizedBox(height: Sizes.dimen_12.h),
                    const PlayersSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
