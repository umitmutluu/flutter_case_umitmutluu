import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_case_umitmutluu/core/constants/asset_constants.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SelectedCheckButton extends GestureDetector {
  SelectedCheckButton(this.onPressed, this.checked, this.context, {super.key})
      : super(
          onTap: () {
            HapticFeedback.mediumImpact();
            onPressed();
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: context.itemBackGround,
            child: checked
                ? SvgPicture.asset(
                    AssetConstants.checkIcon,
                    width: 12.sp,
                    height: 12.sp,
                    colorFilter:
                        ColorFilter.mode(context.primaryColor, BlendMode.srcIn),
                  )
                : const SizedBox.shrink(),
          ),
        );
  final VoidCallback onPressed;
  final bool checked;
  final BuildContext context;
}
