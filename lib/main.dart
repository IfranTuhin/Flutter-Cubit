import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_3/Bloc/cubit/SecondBloc/cubit/change_text_cubit.dart';
import 'package:flutter_bloc_3/Bloc/cubit/color_change_cubit.dart';
import 'package:flutter_bloc_3/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ColorChangeCubit(),
          ),
          BlocProvider(
            create: (context) => ChangeTextCubit(),
          ),
        ],
        child: HomePage(),
      ),
    );
  }
}
