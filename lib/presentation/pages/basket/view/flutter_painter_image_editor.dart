import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:image_editor_plus/data/image_item.dart';
import 'package:image_editor_plus/image_editor_plus.dart';
import 'package:image_editor_plus/options.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';

@RoutePage()
class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  final imageDataNotifier = ValueNotifier(Uint8List(0));
  final originalImage = ValueNotifier(Uint8List(0));
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getImage() async {
    final pickedFile = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      final val = await pickedFile.readAsBytes();
      originalImage.value = val;
      imageDataNotifier.value = val;
    }
  }



  Future<void> saveImage() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Sending Message"),
      ),
    );
    await ImageGallerySaver.saveImage(originalImage.value);
    await ImageGallerySaver.saveImage(imageDataNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ImageEditor Example"),
        centerTitle: true,
        leading:
            IconButton(onPressed: saveImage, icon: Icon(Icons.add_business)),
      ),
      body: ValueListenableBuilder(
        valueListenable: imageDataNotifier,
        builder: (context, value, child) {
          return value.isEmpty
              ? GestureDetector(
                  onTap: getImage,
                  child: Container(
                    width: 500,
                    height: 300,
                    color: Colors.orange,
                  ))
              : Column(
                  children: [
                    Expanded(
                        child: GestureDetector(
                            onTap: getImage,
                            child: Image.memory(imageDataNotifier.value))),
                    ElevatedButton(
                      child: const Text("Single image editor"),
                      onPressed: () async {
                        var editedImage = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ImageEditorDrawing(
                              options:  BrushOption(isFakeImage: true),

                              image: ImageItem(imageDataNotifier.value),
                            ),
                          ),
                        );
                        // replace with edited image
                        if (editedImage != null) {
                          imageDataNotifier.value = editedImage;
                          setState(() {});
                        }
                      },
                    ),
                  ],
                );
        },
      ),
    );
  }
}
