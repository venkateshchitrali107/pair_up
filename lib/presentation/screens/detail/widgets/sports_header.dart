import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import 'selection_chip.dart';

class SportsHeader extends StatefulWidget {
  const SportsHeader({super.key});

  @override
  State<SportsHeader> createState() => _SportsHeaderState();
}

class _SportsHeaderState extends State<SportsHeader> {
  int selectedSportIndex = 0;

  final List<String> sports = ['Tennis', 'Padel', 'Pickleball'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.selectSport,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_16.sp,
          ),
        ),
        SizedBox(height: Sizes.dimen_16.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              sports.asMap().entries.map((entry) {
                final index = entry.key;
                final sport = entry.value;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_4.w),
                  child: SelectionChip(
                    label: sport,
                    isSelected: selectedSportIndex == index,
                    onTap: () {
                      setState(() {
                        selectedSportIndex = index;
                      });
                      debugPrint('Selected sport: $sport');
                    },
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
