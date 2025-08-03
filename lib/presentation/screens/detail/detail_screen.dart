import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pair_up/presentation/screens/detail/widgets/detail_header.dart';

import '../../../utils/constants/size.dart';
import '../../themes/app_colors.dart';
import 'widgets/play_type_header.dart';
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
                padding: EdgeInsets.all(Sizes.dimen_16.h),
                child: Column(
                  children: [
                    const DetailHeader(),
                    SizedBox(height: Sizes.dimen_24.h),
                    const SportsHeader(),
                    SizedBox(height: Sizes.dimen_24.h),
                    const PlayTypeHeader(),
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
