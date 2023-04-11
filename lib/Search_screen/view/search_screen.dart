import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/Layout_screen/cubit/cubit.dart';
import 'package:news/Layout_screen/cubit/states.dart';
import 'package:news/Search_screen/view/widgets/default_textfield.dart';
import 'package:news/component/articale_builder.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsStates>(
      builder: (context, state) {
        List<dynamic> list = NewsCubit.getInstance(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: DefaultTextField(
                  label: 'Search',
                  prefixIcon: Icons.search,
                  controller: searchController,
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'enter some thing';
                    }
                    return null;
                  },
                  onChanged: (v) {
                    NewsCubit.getInstance(context).getSearch(text: v);
                  },
                ),
              ),
              Expanded(child: ArticaleBuilder(list: list, isSearch: true))
            ],
          ),
        );
      },
    );
  }
}
