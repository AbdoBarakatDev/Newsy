import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/news_cubit.dart';
import 'package:news_app/layouts/news_app/cubit/news_states.dart';
import 'package:news_app/modules/news_app/search/search_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';

class NewsLayout extends StatelessWidget {
  static final String id = "News Layout";

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          NewsCubit newsCubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text("Newsy"),
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    doNamedNavigation(context, SearchScreen.id);
                  },
                ),
                IconButton(
                  icon: Icon(Icons.brightness_4),
                  onPressed: () {
                    AppCubit.get(context).changeThemeMode();
                  },
                ),
              ],
            ),
            body: newsCubit.newsScreens[newsCubit.indexOfBottomNav],
            bottomNavigationBar: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  label: "Business",
                  icon: Icon(Icons.business_center),
                ),
                BottomNavigationBarItem(
                  label: "Sports",
                  icon: Icon(Icons.sports_volleyball_outlined),
                ),
                BottomNavigationBarItem(
                  label: "Science",
                  icon: Icon(Icons.science ),
                ),
              ],
              currentIndex: newsCubit.indexOfBottomNav,
              onTap: (value) {
                newsCubit.changeIndexOfBottomNav(value);
              },
              elevation: 20,
              selectedItemColor: Colors.deepOrange,
              showSelectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
          );
        });
  }
}
