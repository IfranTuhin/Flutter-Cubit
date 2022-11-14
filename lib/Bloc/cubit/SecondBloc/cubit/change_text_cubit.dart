import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'change_text_state.dart';

class ChangeTextCubit extends Cubit<ChangeTextState> {
  ChangeTextCubit() : super(ChangeTextInitial());

  void changeText(String s) {
    emit(ChangeText(text: s));
  }
}
