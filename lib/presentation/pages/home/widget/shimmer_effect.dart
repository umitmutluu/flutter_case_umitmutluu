import 'package:flutter/material.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100.0,
          width: double.infinity,
          child: Shimmer.fromColors(
            baseColor: context.itemBackGround,
            highlightColor: context.itemBackGround2,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemBuilder: (context, index) => Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: context.primaryColor)),
              ),
            ),
          ),
        ),
        Expanded(
          child: Shimmer.fromColors(
            baseColor: context.itemBackGround,
            highlightColor: context.itemBackGround2,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 12.sp),
              shrinkWrap: true,
              itemCount: 10,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  trailing: Shimmer.fromColors(
                      baseColor: context.itemBackGround,
                      highlightColor: context.itemBackGround2,
                      child: const CircleAvatar(radius: 10),
                  ),
                  leading: Shimmer.fromColors(
                    baseColor: context.itemBackGround,
                    highlightColor: context.itemBackGround2,
                    child: const CircleAvatar(radius: 20),
                ),
                  title: Shimmer.fromColors(
                    baseColor: context.itemBackGround,
                    highlightColor: context.itemBackGround2,
                    child: Column(mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 300,height: 5,color:Colors.white),
                        const SizedBox(height: 6,),
                        Container(width: 200,height: 5,color: Colors.white),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
