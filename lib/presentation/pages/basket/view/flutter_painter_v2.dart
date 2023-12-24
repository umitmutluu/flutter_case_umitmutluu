/*
import 'package:auto_route/annotations.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui' as ui;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_case_umitmutluu/core/constants/asset_constants.dart';
import 'package:flutter_case_umitmutluu/core/extensions/context_extensions.dart';
import 'package:flutter_case_umitmutluu/core/l10n/l10n.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/basket/cubit/basket_cubit.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/home/cubit/home_cubit.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/home/widget/shimmer_effect.dart';
import 'package:flutter_case_umitmutluu/presentation/pages/utilities/dialog_utility.dart';
import 'package:flutter_painter_v2/flutter_painter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  late PainterController controller;
  ui.Image? backgroundImage;
  ui.Image? foreGroundImage;

  void initBackground() async {
    final image =
    await const NetworkImage('https://picsum.photos/500/300/',)
        .image;
    final bg = await const AssetImage(AssetConstants.bg).image;

    final double imageAspectRatio = image.width / image.height;
    final double bgAspectRatio = bg.width / bg.height;

    setState(() {
      backgroundImage = bg;
      foreGroundImage = image;

      controller.background = bg.backgroundDrawable;
      controller.addImage(
          image
      );
    });
  }

  void undo() {
    controller.undo();
  }

  void redo() {
    controller.redo();
  }

  @override
  void initState() {
    controller = PainterController(

      settings: PainterSettings(
        object: ObjectSettings(layoutAssist: ObjectLayoutAssistSettings(),),

        freeStyle: const FreeStyleSettings(
          color: Colors.orange,
          strokeWidth: 5,
        ),

      ),
    );
    initBackground();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(onPressed: saveImage, icon: Icon(Icons.add)),
          actions: [
            IconButton(
              onPressed: undo,
              icon: Icon(
                Icons.keyboard_arrow_left,
              ),
            ),
            IconButton(
              onPressed: redo,
              icon: Icon(
                Icons.keyboard_arrow_right,
              ),
            )
          ]),
      body: BlocBuilder<BasketCubit, BasketState>(
        builder: (context, state) {
          if (state.status == BasketStatus.loading) {
            return const ShimmerEffect();
          }
          if (state.status == BasketStatus.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(context.translate.empty),
                  SizedBox(
                    height: 50.sp,
                  ),
                  SvgPicture.asset(
                    AssetConstants.empty,
                    width: 100.sp,
                    height: 100.sp,
                  ),
                ],
              ),
            );
          }
          if (state.status == BasketStatus.success) {
            return ValueListenableBuilder<PainterControllerValue>(
                valueListenable: controller,
                child: const Text("Flutter Painter Example"),
                builder: (context, _, child) {
                  return Stack(children: [
                    if (foreGroundImage != null)
                      Positioned.fill(
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: backgroundImage!.width /
                                backgroundImage!.height,
                            child: FlutterPainter.builder(
                              builder: (context, painter) =>DecoratedBox(decoration: BoxDecoration(color: Colors.red),child: painter,) ,
                              controller: controller,

                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: ValueListenableBuilder(
                        valueListenable: controller,
                        builder: (context, _, __) => Slider.adaptive(
                            min: 2,
                            max: 25,
                            value: controller.freeStyleStrokeWidth,
                            onChanged: setFreeStyleStrokeWidth),
                      ),
                    ),
                  ]);
                });
          }
          return ErrorWidget('Error');
        },
      ),
      bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Row(children: [
            Expanded(
              child: FilledButton(
                onPressed: deleteAllItems,
                child: Text(context.translate.delete),
              ),
            ),
            SizedBox(
              width: 12.sp,
            ),
            Expanded(
              child: FilledButton(
                onPressed: () => openBottomSheet(state, context),
                child: Text(context.translate.show),
              ),
            ),
            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, _, __) => IconButton(
                icon: Icon(
                  PhosphorIconsBold.eraser,
                  color: controller.freeStyleMode == FreeStyleMode.erase
                      ? Theme.of(context).primaryColor
                      : null,
                ),
                onPressed: toggleFreeStyleErase,
              ),
            )
          ]);
        },
      ),
    );
  }

  Future<void> saveImage() async {
    final foreGroundIMageSize = Size(
        foreGroundImage!.width.toDouble(), foreGroundImage!.height.toDouble());
    controller.background =
    const ColorBackgroundDrawable(color: Colors.transparent);
    final imageFuture = await controller
        .renderImage(foreGroundIMageSize)
        .then<Uint8List?>((ui.Image image) => image.pngBytes);
    await ImageGallerySaver.saveImage(imageFuture!);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Favorited ')),
    );
  }

  void deleteAllItems() {
    context.read<BasketCubit>().deleteAllValue();
  }

  Future? openBottomSheet(HomeState state, BuildContext context) {
    final storedValues = state.isAddedValues
        .where((element) => element.values.first == true)
        .toList();
    final cubit = context.read<BasketCubit>();
    return storedValues.isNotEmpty
        ? DialogUtility.showBottomSheet(
      context,
      content: GridView.builder(
        shrinkWrap: true,
        itemCount: storedValues.length,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
        itemBuilder: (context, index) => Column(
          children: [
            GestureDetector(
              onTap: () async {
                HapticFeedback.mediumImpact();
                cubit.saveStorage(storedValues[index].keys.first);
              },
              child: CircleAvatar(
                radius: 30.sp,
                backgroundImage: CachedNetworkImageProvider(
                    storedValues[index].keys.first.imageUrl),
              ),
            ),
            Text(
              storedValues[index].keys.first.type,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: context.labelCross),
            )
          ],
        ),
      ),
    )
        : null;
  }

  void toggleFreeStyleErase() {
    controller.freeStyleMode = controller.freeStyleMode != FreeStyleMode.erase
        ? FreeStyleMode.erase
        : FreeStyleMode.none;
  }

  void setFreeStyleStrokeWidth(double value) {
    controller.freeStyleStrokeWidth = value;
  }
}
*/
