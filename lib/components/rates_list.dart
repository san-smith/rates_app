import 'package:flutter/material.dart';
import 'package:rates_app/models/rate.dart';
import 'package:rates_app/components/rate_item.dart';

class RatesList extends StatelessWidget {
  final List<Rate> list;

  RatesList({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.fromLTRB(0, 150, 0, 0),
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (BuildContext context, int index) {
          return RateItem(
            item: list[index],
          );
        });
  }
}
