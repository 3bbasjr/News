
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/news/states_news.dart';
import 'package:news/styles/Theme.dart';
import 'constants/bloc_observer.dart';
import 'network/local/cache.dart';
import 'network/remote/dio.dart';
import 'news/cubit_news.dart';
import 'news/news.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  bool? isDark = CacheHelper.GetData(key: 'isDark');
  runApp(MyApp(isDark));
}
class MyApp extends StatelessWidget{
  final bool? isDark;
  MyApp(this.isDark);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create:(context) => NewsCubit()..getBusinessData()..getSportsData()..getScienceData()),
        BlocProvider(
          create: (BuildContext context)=>NewsCubit()..darkToggle(
            fromShared: isDark,
          ),)
      ],
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
              themeMode: NewsCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
              darkTheme: darkTheme,
              debugShowCheckedModeBanner: false,
              theme: lightTheme,

              home: News()
          );
        },
      ),
    );
  }



}

