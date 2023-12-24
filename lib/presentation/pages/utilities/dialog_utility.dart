import 'package:flutter/material.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogUtility {
  static Future<T?> showBottomSheet<T>(
    final BuildContext context, {
    final Color? backgroundColor,
    final Widget? content,
    final bool isScrollControlled = false,
    final bool isDismissible = true,
    final Color barrierColor = Colors.black26,
    final Color? dismissHolderColor,
  }) async {
    return showModalBottomSheet<T?>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: isScrollControlled,
      enableDrag: isDismissible,
      isDismissible: isDismissible,
      elevation: 0,
      barrierColor: barrierColor,
      builder: (_) {
        return SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                0,
                0,
                MediaQuery.of(context).viewInsets.bottom > 0
                    ? MediaQuery.of(context).viewInsets.bottom
                    : 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.sp),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: backgroundColor ?? context.label,
                    borderRadius: BorderRadius.circular(16.sp),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (isDismissible)
                        Padding(
                          padding: EdgeInsets.only(top: 8.sp),
                          child: Container(
                            decoration: BoxDecoration(
                              color: dismissHolderColor ?? context.primaryColor,
                              borderRadius: BorderRadius.circular(24.sp),
                            ),
                            height: 3.sp,
                            width: 36.sp,
                          ),
                        )
                      else
                        const SizedBox(),
                      content ?? SizedBox(height: 100.sp),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
