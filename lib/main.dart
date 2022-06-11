import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layouts/news_app/cubit/news_cubit.dart';
import 'package:news_app/layouts/news_app/news_layout.dart';
import 'package:news_app/modules/news_app/business/business_screen.dart';
import 'package:news_app/modules/news_app/news_view/news_view.dart';
import 'package:news_app/modules/news_app/science/science_screen.dart';
import 'package:news_app/modules/news_app/search/search_screen.dart';
import 'package:news_app/modules/news_app/sports/sports_screen.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/app_cubit.dart';
import 'package:news_app/shared/cubit/app_states.dart';
import 'package:news_app/shared/network/local/darkness_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';
import 'package:news_app/shared/styles/themes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CashHelper.init();
  bool isDarkFromShared = CashHelper.getBoolean(key: "isDark");

  BlocOverrides.runZoned(
    () {
      runApp(MyApp(
        isDark: isDarkFromShared,
      ));
    },
    blocObserver: MyBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  final bool isDark;

  MyApp({
    this.isDark,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider<NewsCubit>(
            create: (context) =>
                NewsCubit()..buildCustomCategory(category: "business")),
        BlocProvider<AppCubit>(
          create: (context) =>
              AppCubit()..changeThemeMode(isDarkFromShared: isDark),
        ),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            title: 'Flutter Revision',
            home: NewsLayout(),
            initialRoute: NewsLayout.id,
            routes: {
              NewsLayout.id: (context) => NewsLayout(),
              ScienceScreen.id: (context) => ScienceScreen(),
              BusinessScreen.id: (context) => BusinessScreen(),
              SportsScreen.id: (context) => SportsScreen(),
              SearchScreen.id: (context) => SearchScreen(),
              NewsWebView.id: (context) => NewsWebView(),
            },
          );
        },
      ),
    );
  }
}
