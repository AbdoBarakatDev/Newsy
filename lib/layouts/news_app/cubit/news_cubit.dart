import 'package:bloc/bloc.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/news_states.dart';
import 'package:news_app/modules/news_app/business/business_screen.dart';
import 'package:news_app/modules/news_app/science/science_screen.dart';
import 'package:news_app/modules/news_app/sports/sports_screen.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';


class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());
  List<Widget> newsScreens = [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];
  List<dynamic> articles;
  List<dynamic> search;

  static NewsCubit get(BuildContext context) => BlocProvider.of(context);
  int indexOfBottomNav = 0;

  changeIndexOfBottomNav(int index) {
    indexOfBottomNav = index;
    if (index == 0) {
      buildCustomCategory(category: "business");
    } else if (index == 1) {
      buildCustomCategory(category: "sports");
    } else if (index == 2) {
      buildCustomCategory(category: "science");
    }
    emit(NewsChangeBottomNavStates());
  }

  buildCustomCategory({@required String category}) {
    articles = [];
    emit(NewsGetDataLoadingStates());
    if (articles == null || articles.length == 0) {
      return DioHelper.get(
        url: "v2/top-headlines",
        query: {
          "country": "eg",
          "category": "$category",
          "apiKey": "9e94d2799d4a48fe872d43f70f48a274",
        },
      ).then((value) {
        articles = value.data['articles'];
        emit(NewsSuccessfullyGettingDataStates());
      }).catchError((error, stackTrace) {
        print("Error is: ${error.toString()}");
        emit(NewsErrorGettingDataStates(error));
      });
    } else {
      emit(NewsSuccessfullyGettingDataStates());
    }
  }

  buildSearch(String value) {
    search = [];
    emit(NewsSearchGetDataLoadingStates());
    return DioHelper.get(
      url: "v2/everything",
      query: {
        "q": "$value",
        "apiKey": "9e94d2799d4a48fe872d43f70f48a274",
      },
    ).then((value) {
      search = value.data['articles'];
      print("Search of 0 is: ${search[0]['title']}");
      emit(NewsSearchSuccessfullyGettingDataStates());
    }).catchError((error, stackTrace) {
      print("Error is: ${error.toString()}");
      emit(NewsSearchErrorGettingDataStates(error));
    });
  }

}
