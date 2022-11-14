import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_3/Bloc/cubit/SecondBloc/cubit/change_text_cubit.dart';
import 'package:flutter_bloc_3/Bloc/cubit/color_change_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ColorChangeCubit, ColorChangeState>(
      listener: (context, state) {
        if (state is AppColorChange) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text("Color change"),
              backgroundColor: Colors.indigo,
              behavior: SnackBarBehavior.floating,
              duration: Duration(milliseconds: 2000),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: BlocBuilder<ColorChangeCubit, ColorChangeState>(
          builder: (context, state) {
            if (state is! AppColorChange) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.indigo,
                ),
              );
            } else {
              final data = (state as AppColorChange).color;
              return Container(
                height: MediaQuery.of(context).size.height,
                color: data,
                child: Column(
                  children: [
                    BlocConsumer<ChangeTextCubit, ChangeTextState>(
                      listener: (context, state) {
                        // TODO: implement listener
                      },
                      builder: (context, state) {
                        if (state is! ChangeText) {
                          return Container(
                            height: 100,
                            width: MediaQuery.of(context).size.height,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "State Not Emit",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          );
                        } else if (state is ChangeText) {
                          final data = (state as ChangeText).text;
                          return Container(
                            height: 100,
                            width: MediaQuery.of(context).size.height,
                            color: Colors.green,
                            child: Center(
                              child: Text(
                                "${data}",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                            ),
                          );
                        }
                        return Container();
                      },
                    )
                  ],
                ),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            BlocProvider.of<ColorChangeCubit>(context)
                .colorChange(color: Colors.deepOrange);
            BlocProvider.of<ChangeTextCubit>(context)
                .changeText("State is Emit");
          },
          child: Text("C"),
        ),
      ),
    );
  }
}
