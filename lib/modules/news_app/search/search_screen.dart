import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/news_cubit.dart';
import 'package:news_app/layouts/news_app/cubit/news_states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  static final String id = "SearchScreen";
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).search;
        print("List Are $list");
        return Scaffold(
          appBar: AppBar(
            title:Text("Search"),
          ),
          body: Column(
            children: [
              defaultTextFormField(
                hintText: "Search",
                // hintStyle:Theme.of(context).
                textInputType: TextInputType.text,
                onChange: (value){
                  NewsCubit.get(context).buildSearch(value);
                  print(" valueeeeeee is :$value");
                },
                prefixIcon: Icons.search,
                controller: searchController,
                validatorFunction: (String value) {
                  if (value.isEmpty) {
                    return "Search must not be empty";
                  } else {
                    return null;
                  }
                },
              ),
              Expanded(child: buildFullScreen(list,isSearch: true)),
            ],
          ),
        );
      },
    );
  }
}
