import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quotes_app/globals/quotes_data.dart';
import 'package:quotes_app/routes/routes.dart';

Expanded gridViewWidget() {
  return Expanded(
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
      ),
      itemCount: quotes.length,
      itemBuilder: (
        context,
        index,
      ) {
        // var qt = quotes[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.detailPage,
              arguments: quotes[index],
            );
          },
          child: Card(
            elevation: 3,
            color: Colors.green.shade50,
            surfaceTintColor: Colors.red,
            shadowColor: Colors.black54,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                15,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(
                12.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        quotes[index].quote,
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  Expanded(
                    child: Text(
                      "- ${quotes[index].author}",
                      style: GoogleFonts.roboto(
                        fontSize: 12.sp,
                        fontStyle: FontStyle.italic,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
