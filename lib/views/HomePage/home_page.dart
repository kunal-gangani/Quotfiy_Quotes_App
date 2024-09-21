import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/globals/quotes_data.dart';
import 'package:quotes_app/views/HomePage/components/grid_view.dart';
import 'package:quotes_app/views/HomePage/components/list_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool toggle = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      if (quotes.isNotEmpty) {
        Random random = Random();
        int index = random.nextInt(quotes.length);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(
                quotes[index].category,
              ),
              content: Text(
                quotes[index].quote,
              ),
            );
          },
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (val) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text(
                "Exit Confirmation",
              ),
              content: const Text(
                "Are you sure you want to Exit?",
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    exit(0);
                  },
                  child: const Text(
                    "Confirm Exit",
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Go Back",
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFF4D03F),
          title: const Text(
            "Explore",
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  toggle = !toggle;
                });
              },
              icon: toggle
                  ? const Icon(
                      Icons.grid_on,
                    )
                  : const Icon(
                      Icons.list,
                    ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Awesome quotes from our Community",
                style: GoogleFonts.roboto(
                  fontSize: 17.sp,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                  height: 1.5,
                ),
              ),
              SizedBox(
                height: 16.h,
              ),
              Expanded(
                child: toggle ? listViewWidget() : gridViewWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
