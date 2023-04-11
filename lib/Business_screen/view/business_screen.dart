import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Layout_screen/cubit/cubit.dart';
import 'package:news/Layout_screen/cubit/states.dart';
import 'package:news/component/articale_builder.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(builder: (context, state) {
     List<dynamic> list=NewsCubit.getInstance(context).business;
     return ArticaleBuilder(list: list,isSearch:false);
    }, listener: (context, state) {   },);
  }
}