import 'package:flexify/flexify.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/globals/quotes_data.dart';
import 'package:quotes_app/routes/routes.dart';
import 'package:quotes_app/views/DetailPage/detail_page.dart';

Expanded listViewWidget() {
  return Expanded(
    child: Scrollbar(
      thumbVisibility: true,
      interactive: true,
      trackVisibility: true,
      thickness: 5,
      radius: const Radius.circular(10),
      child: ListView.separated(
        separatorBuilder: (context, index) => const Divider(
          color: Colors.blueGrey,
          thickness: 1.5,
        ),
        itemCount: quotes.length,
        itemBuilder: (
          context,
          index,
        ) {
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
              surfaceTintColor: Colors.red,
              color: Colors.green.shade50,
              shadowColor: Colors.black,
              child: ListTile(
                leading: Text(
                  "${index + 1}",
                ),
                title: Text(
                  quotes[index].quote,
                ),
                subtitle: Text(
                  "~ ${quotes[index].author}",
                ),
              ),
            ),
          );
        },
      ),
    ),
  );
}
