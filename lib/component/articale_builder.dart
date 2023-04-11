// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:news/component/articale_shape.dart';
import 'package:news/component/condional_builder.dart';



class ArticaleBuilder extends StatelessWidget {
  final List list;
  final bool isSearch;
   const ArticaleBuilder({
    super.key,
    required this.list,
    required this.isSearch,
  });

  @override
  Widget build(BuildContext context) {
    return ConditionalBuilder(
        condition: list.isNotEmpty,
        builder: (context) => ListView.separated(
              itemCount: list.length,
              itemBuilder: (context, index) {
                return ArticaleShape(map: list[index],);
              },
              separatorBuilder: (context, index) => Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey,
                margin: const EdgeInsetsDirectional.only(start: 20.0),
              ),
            ),
        fallback: ((context) =>isSearch?Container(): const Center(
              child: CircularProgressIndicator(),
            )));
  }
}
