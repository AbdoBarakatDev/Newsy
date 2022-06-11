import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/app_states.dart';
import 'package:news_app/shared/network/local/darkness_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  static AppCubit get(BuildContext context) =>
      BlocProvider.of<AppCubit>(context);


  bool isDark = true;
  IconData iconData = Icons.edit;
  bool bottomSheetOpened = false;


  changeThemeMode({bool isDarkFromShared}) {
    if (isDarkFromShared != null) {
      isDark = isDarkFromShared;
    } else {
      isDark = !isDark;
      CashHelper.putBoolean(key: 'isDark', value: isDark)
          .then((value) => emit(AppChangeModeStates()));
    }
  }
}
