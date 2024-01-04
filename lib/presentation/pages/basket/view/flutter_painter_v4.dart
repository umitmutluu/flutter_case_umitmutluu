/*
import 'dart:io';

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
import 'package:image_picker/image_picker.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

@RoutePage()
class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  static const Color red = Color(0xFFFF0000);
  FocusNode textFocusNode = FocusNode();
  late PainterController controller;
  ui.Image? backgroundImage;
  Paint shapePaint = Paint()
    ..strokeWidth = 5
    ..color = Colors.red
    ..style = PaintingStyle.stroke
    ..strokeCap = StrokeCap.round;
  final ValueNotifier<String> imagePathNotifier = ValueNotifier('');
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    controller = PainterController(
        settings: PainterSettings(
            text: TextSettings(
              focusNode: textFocusNode,
              textStyle: const TextStyle(
                  fontWeight: FontWeight.bold, color: red, fontSize: 18),
            ),
            freeStyle: const FreeStyleSettings(
              color: red,
              strokeWidth: 5,
            ),
            shape: ShapeSettings(
              paint: shapePaint,
            ),
            scale: const ScaleSettings(
              enabled: true,
              minScale: 1,
              maxScale: 5,
            )));
  }

  /// Fetches image from an [ImageProvider] (in this example, [NetworkImage])
  /// to use it as a background

  Future<void> getImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      imagePathNotifier.value = pickedFile.path;
      final foreGroundImage = await FileImage(File(pickedFile.path)).image;
      backgroundImage = foreGroundImage;
      controller.background = foreGroundImage.backgroundDrawable;
    }
  }

  /// Updates UI when the focus changes
  void onFocus() {
    setState(() {});
  }

  Widget buildDefault(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, kToolbarHeight),
          // Listen to the controller and update the UI when it updates.
          child: ValueListenableBuilder<PainterControllerValue>(
              valueListenable: controller,
              child: const Text("Flutter Painter Example"),
              builder: (context, _, child) {
                return AppBar(
                  title: child,
                  actions: [
                    // Delete the selected drawable
                    IconButton(
                      icon: Icon(
                        PhosphorIcons.trash(),
                      ),
                      onPressed: controller.selectedObjectDrawable == null
                          ? null
                          : removeSelectedDrawable,
                    ),
                    // Delete the selected drawable
                    IconButton(
                      icon: const Icon(
                        Icons.flip,
                      ),
                      onPressed: controller.selectedObjectDrawable != null &&
                              controller.selectedObjectDrawable is ImageDrawable
                          ? flipSelectedImageDrawable
                          : null,
                    ),
                    // Redo action
                    IconButton(
                      icon: Icon(
                        PhosphorIcons.arrowClockwise(),
                      ),
                      onPressed: controller.canRedo ? redo : null,
                    ),
                    // Undo action
                    IconButton(
                      icon: Icon(
                        PhosphorIcons.arrowCounterClockwise(),
                      ),
                      onPressed: controller.canUndo ? undo : null,
                    ),
                  ],
                );
              }),
        ),
        // Generate image
        floatingActionButton: FloatingActionButton(
          onPressed: renderAndDisplayImage,
          child: Icon(
            PhosphorIcons.imageSquare(),
          ),
        ),
        body: Stack(
          children: [
            ValueListenableBuilder(
                valueListenable: imagePathNotifier,
                builder: (context, val, _) {
                  return val != ''
                      ? GestureDetector(
                          onTap: getImage,
                          child: Positioned.fill(
                            child: Center(
                              child: FlutterPainter(
                                controller: controller,
                              ),
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: getImage,
                          child: Container(
                              color: Colors.cyanAccent,
                              width: 300,
                              height: 300),
                        );
                }),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: ValueListenableBuilder(
                valueListenable: controller,
                builder: (context, _, __) => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        constraints: const BoxConstraints(
                          maxWidth: 400,
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                          color: Colors.white54,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (controller.freeStyleMode !=
                                FreeStyleMode.none) ...[
                              const Divider(),
                              const Text("Free Style Settings"),
                              // Control free style stroke width
                              Row(
                                children: [
                                  const Expanded(
                                      flex: 1, child: Text("Stroke Width")),
                                  Expanded(
                                    flex: 3,
                                    child: Slider.adaptive(
                                        min: 2,
                                        max: 25,
                                        value: controller.freeStyleStrokeWidth,
                                        onChanged: setFreeStyleStrokeWidth),
                                  ),
                                ],
                              ),
                              if (controller.freeStyleMode ==
                                  FreeStyleMode.draw)
                                Row(
                                  children: [
                                    const Expanded(
                                        flex: 1, child: Text("Color")),
                                    // Control free style color hue
                                    Expanded(
                                      flex: 3,
                                      child: Slider.adaptive(
                                          min: 0,
                                          max: 359.99,
                                          value: HSVColor.fromColor(
                                                  controller.freeStyleColor)
                                              .hue,
                                          activeColor:
                                              controller.freeStyleColor,
                                          onChanged: setFreeStyleColor),
                                    ),
                                  ],
                                ),
                            ],
                            if (textFocusNode.hasFocus) ...[
                              const Divider(),
                              const Text("Text settings"),
                            ],
                            if (controller.shapeFactory != null) ...[
                              const Divider(),
                              const Text("Shape Settings"),
                            ]
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: controller,
          builder: (context, _, __) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Free-style eraser
              IconButton(
                icon: Icon(
                  PhosphorIcons.eraser(),
                  color: controller.freeStyleMode == FreeStyleMode.erase
                      ? Theme.of(context).primaryColor
                      : null,
                ),
                onPressed: toggleFreeStyleErase,
              ),
              // Free-style drawing
              IconButton(
                icon: Icon(
                  PhosphorIcons.scribbleLoop(),
                  color: controller.freeStyleMode == FreeStyleMode.draw
                      ? Theme.of(context).primaryColor
                      : null,
                ),
                onPressed: toggleFreeStyleDraw,
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return buildDefault(context);
  }

  void undo() {
    controller.undo();
  }

  void redo() {
    controller.redo();
  }

  void toggleFreeStyleDraw() {
    controller.freeStyleMode = controller.freeStyleMode != FreeStyleMode.draw
        ? FreeStyleMode.draw
        : FreeStyleMode.none;
  }

  void toggleFreeStyleErase() {
    controller.freeStyleMode = controller.freeStyleMode != FreeStyleMode.erase
        ? FreeStyleMode.erase
        : FreeStyleMode.none;
  }

  void setFreeStyleStrokeWidth(double value) {
    controller.freeStyleStrokeWidth = value;
  }

  void setFreeStyleColor(double hue) {
    controller.freeStyleColor = HSVColor.fromAHSV(1, hue, 1, 1).toColor();
  }

  Future<void> renderAndDisplayImage() async {
    if (backgroundImage == null) return;
    final backgroundImageSize = Size(
        backgroundImage!.width.toDouble(), backgroundImage!.height.toDouble());

    // Render the image
    // Returns a [ui.Image] object, convert to to byte data and then to Uint8List
    controller.background = const ColorBackgroundDrawable(color: Colors.black);
    final imageFuture = await controller
        .renderImage(backgroundImageSize)
        .then<Uint8List?>((ui.Image image) => image.pngBytes);
    await ImageGallerySaver.saveFile(imagePathNotifier.value);

    await ImageGallerySaver.saveImage(imageFuture!);
  }

  void removeSelectedDrawable() {
    final selectedDrawable = controller.selectedObjectDrawable;
    if (selectedDrawable != null) controller.removeDrawable(selectedDrawable);
  }

  void flipSelectedImageDrawable() {
    final imageDrawable = controller.selectedObjectDrawable;
    if (imageDrawable is! ImageDrawable) return;

    controller.replaceDrawable(
        imageDrawable, imageDrawable.copyWith(flipped: !imageDrawable.flipped));
  }
}
*/
