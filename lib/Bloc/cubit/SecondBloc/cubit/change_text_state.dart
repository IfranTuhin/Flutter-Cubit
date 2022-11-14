part of 'change_text_cubit.dart';

@immutable
abstract class ChangeTextState {}

class ChangeTextInitial extends ChangeTextState {}

class ChangeText extends ChangeTextState {
  final String? text;

  ChangeText({this.text});
}
