import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:quotes_app/globals/fonts_enum.dart';
import 'package:quotes_app/modal_class/quotes_class_model.dart';
import 'dart:ui' as ui;

import 'package:share_extend/share_extend.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Color cardColour = Colors.green.shade50;
  double colourOpacity = 1;
  String font = "";
  bool isItalic = true;
  Color fontColour = Colors.black87;

  GlobalKey key = GlobalKey();

  Future<void> copyQuote({
    required QuotesClassModel quote,
  }) async {
    await Clipboard.setData(
      ClipboardData(
        text: "${quote.quote}\n ~ ${quote.author}",
      ),
    ).then(
      (value) {
        SnackBar snackBar = const SnackBar(
          content: Text(
            "Quote copied to clipboard",
          ),
          backgroundColor: Colors.green,
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    QuotesClassModel quote =
        ModalRoute.of(context)!.settings.arguments as QuotesClassModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF4D03F),
        title: Text(
          "${quote.category}",
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              cardColour = Colors.green.shade50;
              colourOpacity = 1;
              font = "";
              isItalic = true;
              fontColour = Colors.black87;
              setState(() {});
            },
            icon: Icon(
              Icons.refresh,
              size: 25.h,
            ),
          ),
        ],
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: RepaintBoundary(
                  key: key,
                  child: Card(
                    elevation: 8,
                    color: cardColour.withOpacity(colourOpacity),
                    shadowColor: Colors.black54,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        20.0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${quote.quote}",
                            style: TextStyle(
                              fontSize: 22.sp,
                              fontStyle: isItalic
                                  ? FontStyle.italic
                                  : FontStyle.normal,
                              fontWeight: FontWeight.w500,
                              color: fontColour,
                              fontFamily: font,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "- ${quote.author}",
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      "Choose your desired background colour :",
                      style: GoogleFonts.urbanist(
                        fontSize: 15.sp,
                      ),
                    ),
                    SizedBox(
                      height: 75.h,
                      child: ListView.builder(
                        itemCount: 18,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: GestureDetector(
                              onTap: () {
                                cardColour = Colors.primaries[index];
                                setState(() {});
                              },
                              child: CircleAvatar(
                                radius: 25.h,
                                backgroundColor: Colors.primaries[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Text(
                      "Change the Opacity of BG :",
                      style: GoogleFonts.urbanist(
                        fontSize: 15.sp,
                      ),
                    ),
                    Slider(
                      value: colourOpacity,
                      min: 0,
                      max: 1,
                      activeColor: cardColour.withOpacity(colourOpacity),
                      onChanged: ((value) {
                        colourOpacity = value;
                        setState(() {});
                      }),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Change the Fonts of Quotes :",
                          style: GoogleFonts.urbanist(
                            fontSize: 15.sp,
                          ),
                        ),
                        Switch(
                          activeColor: cardColour,
                          activeTrackColor: cardColour.withOpacity(
                            0.5,
                          ),
                          inactiveTrackColor: Colors.grey,
                          inactiveThumbColor: Colors.white,
                          value: isItalic,
                          onChanged: (value) {
                            setState(() {
                              isItalic = value;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: Fonts.values.length,
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return TextButton(
                            onPressed: () {
                              font = Fonts.values[index].name;
                              setState(() {});
                            },
                            child: Text(
                              "ABC",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontFamily: Fonts.values[index].name,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Change the Colour of Quotes =>",
                          style: GoogleFonts.urbanist(
                            fontSize: 15.sp,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return ScaffoldMessenger(
                                  child: AlertDialog(
                                    title: Text(
                                      "Pick your Colour ",
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                      ),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ColorPicker(
                                          pickerColor: cardColour,
                                          onColorChanged: (value) {
                                            fontColour = value;
                                            setState(() {});
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(
                            Icons.brush,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            copyQuote(
                              quote: quote,
                            );
                          },
                          child: const Text(
                            "Copy Quote",
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            RenderRepaintBoundary boundary = key.currentContext
                                ?.findRenderObject() as RenderRepaintBoundary;
                            ui.Image image = await boundary.toImage();

                            ByteData? byteData = await image.toByteData(
                              format: ui.ImageByteFormat.png,
                            );

                            Uint8List list = byteData!.buffer.asUint8List();

                            var result = await ImageGallerySaver.saveImage(
                              list,
                              quality: 60,
                              name: quote.category,
                            );

                            if (result['isSuccess']) {
                              SnackBar snackBar = SnackBar(
                                content: const Text(
                                  "Image Saved Successfully",
                                ),
                                backgroundColor: Colors.green.shade100,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }else{
                               SnackBar snackBar = SnackBar(
                                content: const Text(
                                  "Image Saved Failed",
                                ),
                                backgroundColor: Colors.red.shade100,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            "Save as Image",
                          ),
                        ),
                        TextButton(
                          onPressed: () async {
                            try {
                              RenderRepaintBoundary boundary = key.currentContext?.findRenderObject() as RenderRepaintBoundary;
                              ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                              ByteData? byteData = await image.toByteData(format: ui.ImageByteFormat.png);
                              Uint8List pngBytes = byteData!.buffer.asUint8List();

                              final tempDir = await getTemporaryDirectory();
                              final file = await File('${tempDir.path}/quote_image.png');
                              await file.writeAsBytes(pngBytes);

                              ShareExtend.share(file.path, "image");

                              SnackBar snackBar = SnackBar(
                                content: const Text("Image shared successfully!"),
                                backgroundColor: Colors.green.shade100,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            } catch (e) {
                              SnackBar snackBar = SnackBar(
                                content: Text("Failed to share Image: $e"),
                                backgroundColor: Colors.red.shade100,
                              );
                              ScaffoldMessenger.of(context).showSnackBar(snackBar);
                            }
                          },
                          child: const Text(
                            "Share Quote",
                          ),
                        ),

                      ],
                    )
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
