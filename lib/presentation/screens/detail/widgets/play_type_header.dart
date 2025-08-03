import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/constants/size.dart';
import '../../../../utils/extensions/locale_extension.dart';
import 'selection_chip.dart';

class PlayTypeHeader extends StatefulWidget {
  const PlayTypeHeader({super.key});

  @override
  State<PlayTypeHeader> createState() => _PlayTypeHeaderState();
}

class _PlayTypeHeaderState extends State<PlayTypeHeader> {
  int selectedTypeIndex = 0;

  final List<String> playTypes = ['Singles', 'Doubles'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.loc.selectPlayType,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: Sizes.dimen_16.sp,
          ),
        ),
        SizedBox(height: Sizes.dimen_16.h),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children:
              playTypes.asMap().entries.map((entry) {
                final index = entry.key;
                final playType = entry.value;
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_4.w),
                  child: SelectionChip(
                    label: playType,
                    isSelected: selectedTypeIndex == index,
                    onTap: () {
                      setState(() {
                        selectedTypeIndex = index;
                      });
                      debugPrint('Selected play type: $playType');
                    },
                  ),
                );
              }).toList(),
        ),
      ],
    );
  }
}
